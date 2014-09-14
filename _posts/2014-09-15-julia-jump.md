---
layout: post
title: Optimization in Julia using JuMP
display-title: optimization in julia using JuMP
description: Converting code from GurobiPy to the new Julia Mathematical Programming package.
category: essay
---

Recently I have been working on workforce scheduling problems using operations research techniques. The classic [Nurse Scheduling Problem](https://en.wikipedia.org/wiki/Nurse_scheduling_problem)  My interest in problem started with my senior project last year at Washington University in St. Louis, where I used Excel Solver and the Gurobi Python Interface to create solutions. Recently I have returned to my old work as a side project called [StaffJoy](https://www.staffjoy.com). As I have been reformulating the problem, I converted the code from the Gurobi Python interface to an optimization metalanguage called JuMP. JuMP brings extensibility and clarity to optimization community brings a modern extensibility to optimization computing. 

# Background

Operations Research (OR) applies big mathematics to business problems, typically with a goal of minimizing or maximizing some value. Routing, like Google Maps, is an OR problem - “Get me from here to there in the minimum amount of time.” Scheduling is another massive mathematical problem - for example, [Professor Michael Trick schedules every Major League Baseball game in the country](https://www.youtube.com/watch?v=CdECArt8jDM) with goal of minimizing team travel time. 

# Gurobi

Gurobi is one of the largest commercial optimization packages. The software is fast, stable, and decently flexible. The company provides official interfaces in a variety of programming languages. I started using Gurobi in college because they offer free licenses to students. 

As I returned to scheduling problems for StaffJoy, I realized that my Macbook Air lacked sufficient computing power for some problems, so I investigated Gurobi’s pricing for EC2. At $15 per hour, running a large optimization in the could cost hundreds of dollars in licensing fees! Dissuaded, I began investigating other options. 

# JuMP

I learned about the programing language [Julia](http://julia.readthedocs.org/en/release-0.3/) from a group of scientists turned computer programmers. Julia builds on the matrix syntax of [Matlab](https://imgur.com/5zE08DX) and the statistics tools of  [R](https://en.wikipedia.org/wiki/R_%28programming_language%29), but modernizes both with a just-in-time compiler. Best of all, it is open-source and it excels in in distributed and multi-core environments. 

JuMP (“**Ju**lia for **M**athematical **P**rogramming”) is a [project by Miles Lubin and Ian Dunning at MIT](http://www.mit.edu/~mlubin/juliacomputing.pdf) to create a common language for describing optimization problems. The tool builds a common interface to a variety of mathematical solving packages, including Gurobi, some commercial solvers, and a variety of open-source solvers. 

JuMP is a rosetta stone for optimization - with a single formulation, a problem can be tested on a variety of different solving tools. The project is still new and [in active development](https://github.com/JuliaOpt/JuMP.jl), but in its present state is brings a refreshing change to optimization problem formulation. 

<div class="panel panel-info">
    <div class="panel-heading">
        Clarification
    </div>
    <div class="panel-body">
        <p>Gurobi is a solving package. The package includes official interfaces for some programming languages, such as the GurobiPy interface for Python. These interfaces only work with Gurobi. </p>
        <p>JuMP is a way to formulate optimization problems, and it supports multiple different solvers - including Gurobi.</p>
    </div>
</div>

# Speed

The true speed in an optimization problem comes from the solver. Thus, as cool of a language as Julia is, JuMP offers little benefit. It may require marginally less memory, but in computationally-constrained problems this has little benefit. Its real power is the ease of running the same solver on multiple different solvers. Thus, benchmarking between solvers becomes easy.

<img src="/images/optimization-cores.png" alt="32 cores running an optimization"/>

# Usability

The Gurobi Python system provides comprehensive examples and support for a variety of data structures. I used their proprietary [tuplelist](http://www.gurobi.com/documentation/5.6/reference-manual/py_tuplelist) data structure quite extensively. In scheduling problems, it made adding constraints for particular employees or particular time periods straightforward. 

The GurobiPy syntax is readable for short problems, but for complex formulations it becomes exceedingly verbose. In addition, the use of many functions and constants becomes confusing. JuMP adds macros for adding multiple variables and multiple constraints that makes complex formulations more compact. It took about half the lines of code to convert the same problem from GurobiPy to JuMP. 

One of the most frustating parts of the GurobiPy syntax was retrieving variable values after optimization. Instead of using the the Python variables themselves, a uniques string name is assigned during variable creation, and that string is used to retrieve the value after solving. JuMP brings sanity by allowing you to use variables instead of naming schemes to retrieve information. 

Here is an example of adding a couple of variables and constraints in GurobiPy. The code means nothing, but basically we are defining a start time, and end time, and an event time with the event between start and finish. With more complex variables (such as tupleLists), breaking "addVar" and "addConstraint" calls into multiple lines becomes necessary due to line length and legibility.

    from gurobipy import *

    m = Model('example')
    t_max = 100

    # variables
    start = m.addVar(
        vtype = GRB.INTEGER,
        lb = 0,
        ub =  t_max,
        name = "start"
    )
    finish = m.addVar(
        vtype = GRB.INTEGER,
        lb = 0,
        ub =  t_max,
        name = "finish"
    )
    event = m.addVar(
        vtype = GRB.INTEGER,
        lb = 0,
        ub =  t_max,
        name = "event"
    )

    # constaraints
    m.addConstraint(
        start,
        GRB.LESS_EQUAL,
        finish,
    )
    m.addConstraint(
        event,
        GRB.GREATER_EQUAL,
        start,
    )
    m.addConstraint(
        event,
        GRB.LESS_EQUAL,
        finish,
    )


This is the same formulation in JuMP:

    using JuMP

    m = Model()
    t_max = 100

    # variables
    @defVar(m, 0 <= start <= t_max, Int)
    @defVar(m, 0 <= finish <= t_max, Int)
    @defVar(m, 0 <= event <= t_max, Int)

    # constraints
    @addConstraints m begin
        start <= finish
        event >= start
        event <= finish
    end

# Documentation

In general, Gurobi’s documentation is lacking. It uses frustrating pagination, often [lacks details](http://www.gurobi.com/documentation/5.6/reference-manual/py_model_presolve), and makes finding basic information such as “[What does SOS constraint mean?](http://www.gurobi.com/documentation/5.6/reference-manual/py_sos)” nearly impossible.

 [JuMP’s documentation](https://jump.readthedocs.org/en/latest/) is maintained within the open-source project using Sphinx and LaTeX, so it is quite up-to-date. However, some information is lacking about support for various features in different solvers. For example, documentation does not clarify which solvers support single ordered set constraints, and it does not specify which solvers support multi-threaded solving. 


# Community

To my surprise, Gurobi was quite responsive when I complained about their documentation on Twitter. They put me in touch with an engineer who is redoing their documentation. I have not seen any changes yet, but it seems that improved documentation is a priority. 

The Julia optimization community is quite active, and currently it is composed of many researchers from the OR department at MIT. The [JuliaOpt Mailing List](https://groups.google.com/forum/#!forum/julia-opt) is responsive and helpful. Even issues with the core JuMP packages are addressed quickly - [I submitted a feature request that was fulfilled within a few hours](https://github.com/JuliaOpt/JuMP.jl/issues/243).


# Conclusion

If you are working on optimization problems, it is worth trying JuMP. The community is defining the future of operations research projects. 


# Looking Forward

 My experiments in converting GurobiPy to JuMP were successful, but it appears that branch-and-bound algorithms are too inefficient for my scheduling formulations, so I am working to convert the techniques to a custom tree-based solver that can be run via [MapReduce](https://en.wikipedia.org/wiki/MapReduce)


