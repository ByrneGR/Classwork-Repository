class Api::BenchesController < ApplicationController

  def index
    @benches = Bench.all
  end

  def create
    @bench = Bench.new(bench_params)
  end  

  def bench_params
    params.require(:bench).permit(:description, :lat, :long)
  end  
end
