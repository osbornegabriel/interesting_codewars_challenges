class Interpreter

  def initialize
    @vars = {}
    @functions = {}
    @tokens = []
  end

  def input expr
    # your code here - feel free to use and/or modify the provided tokenizer
    @tokens = tokenize(expr).map{|a|a[0]}
    p @tokens.map!{|x| convert_integer(x)}
    @tokens.map!{|x| @vars.keys.include?(x) ? @vars[x] : x}
    raise 'Invalid identifier' if @tokens[0].is_a?(String) && @tokens[1] != "="
    if @tokens.include?("=")
      values = @tokens.reject{|x| x == "="}
      store_variable(values)
    elsif @tokens.size == 1
      @tokens[0]
    else
      operator = @tokens.reject{|x| x.is_a?(Integer)}.reduce
      numbers = @tokens.select{|x| x.is_a?(Integer)}
      p operator
      operate(operator, numbers)
    end
  end

  private

  def store_variable(values)
    p @tokens
    @vars[values[0]] = values[1]
    values[1]
  end

  def operate(operator, values)
      values.reduce(operator)
  end

  def convert_integer(n)
    if n != '0' && n.to_i != 0
      return n.to_i
    elsif n == '0'
      0
    else
      n
    end
  end

  def tokenize program
    return [] if program == ''

    regex = /\s*([-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/
    program.scan(regex).select { |s| !(s =~ /^\s*$/) }
  end
end