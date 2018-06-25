require "benchmark"
require "./orm_test/*"

DATABASE = {host: "localhost", name: "crystal_orm_test", user: "postgres"}

def bench_simple_insert
  puts "BENCHMARKING simple_insert"
  Benchmark.bm do |x|
    x.report("clear simple_insert") do
      1000.times do
        OrmTestClear.simple_insert 
      end
    end
    x.report("core simple_insert") do
      1000.times do
        OrmTestCore.simple_insert
      end
    end
    x.report("crecto simple_insert") do
      1000.times do
        OrmTestCrecto.simple_insert
      end
    end    
    x.report("granite simple_insert") do
      1000.times do
        OrmTestGranite.simple_insert
      end
    end
    # TODO: Add in once crystal 0.25.0 is supported
    #x.report("jennifer simple_insert") do
    #  1000.times do
    #    OrmTestJennifer.simple_insert
    #  end
    #end
    x.report("lucky_record simple_insert") do
      1000.times do
        OrmTestLuckyRecord.simple_insert
      end
    end
  end
end

def bench_simple_select
  puts "BENCHMARKING simple_select"
  Benchmark.bm do |x|
    x.report("clear simple_select") do
      1000.times do
        OrmTestClear.simple_select 
      end
    end
    x.report("core simple_select") do
      1000.times do
        OrmTestCore.simple_select 
      end
    end
    x.report("crecto simple_select") do
      1000.times do
        OrmTestCrecto.simple_select 
      end
    end
    x.report("granite simple_select") do
      1000.times do
        OrmTestGranite.simple_select 
      end
    end
    #x.report("jennifer simple_select") do
    #  1000.times do
    #    OrmTestJennifer.simple_select 
    #  end
    #end
    x.report("lucky_record simple_select") do
      1000.times do
        OrmTestLuckyRecord.simple_select 
      end
    end
  end
end

bench_simple_insert
bench_simple_select
