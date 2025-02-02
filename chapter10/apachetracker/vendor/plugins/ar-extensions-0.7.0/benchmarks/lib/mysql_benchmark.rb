class MysqlBenchmark < BenchmarkBase
    
  def benchmark_all( array_of_cols_and_vals )
    methods = self.methods.find_all { |m| m =~ /benchmark_/ }
    methods.delete_if{ |m| m =~ /benchmark_(all|model)/ }
    methods.each { |method| self.send( method, array_of_cols_and_vals ) }
  end
  
  def benchmark_myisam( array_of_cols_and_vals )
    bm_model( TestMyISAM, array_of_cols_and_vals )
  end
    
  def benchmark_innodb( array_of_cols_and_vals )
    bm_model( TestInnoDb, array_of_cols_and_vals )
  end
  
  def benchmark_memory( array_of_cols_and_vals )
    bm_model( TestMemory, array_of_cols_and_vals )
  end
  
  # TODO utilize this in the benchmark
  def b1enchmark_temporary( array_of_cols_and_vals )
    bm_model( TestTemporary, array_of_cols_and_vals )
  end
    
end

