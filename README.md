## JSON encoding benchmarks for ruby

Two JSON encoders are tested: Oj and Yajl.


## Running the benchmark

```shell
$ bundle exec ruby json_benchmark.rb
```

```
Rehearsal ----------------------------------------
Yajl   7.406112   0.191133   7.597245 (  7.601342)
Oj     7.147419   0.190989   7.338408 (  7.341933)
------------------------------ total: 14.935653sec

           user     system      total        real
Yajl   7.416763   0.221372   7.638135 (  7.641745)
Oj     7.180844   0.231350   7.412194 (  7.415275)
```

Findings: Oj is slightly faster for this contrived example on a 2017 MacBook Pro 2.8 GHz Core i7 using Ruby v2.6.6
