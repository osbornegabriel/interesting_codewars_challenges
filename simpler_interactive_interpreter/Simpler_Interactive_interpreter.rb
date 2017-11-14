class Interpreter

  def initialize
    @vars = {}
    @functions = {}
    @tokens = []
  end

  def input expr
    # your code here - feel free to use and/or modify the provided tokenizer
    @tokens = tokenize(expr).map{|a|a[0]}
    0
  end

  private

  def tokenize program
    return [] if program == ''

    regex = /\s*([-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/
    program.scan(regex).select { |s| !(s =~ /^\s*$/) }
  end
end