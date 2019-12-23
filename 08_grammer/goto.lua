function f()
    do goto the_end end
    print("never execute")

::the_end::
    print("f end")
end

f()