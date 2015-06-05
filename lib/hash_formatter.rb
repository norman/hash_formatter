require 'ruby_parser'
require 'ruby2ruby'

class HashFormatter
  include Enumerable

  def initialize(string)
    @parser = RubyParser.new
    @r2r    = Ruby2Ruby.new
    @hash   = parse(string)
  end

  def to_multiline
    "{\n%s\n}" % map {|(k, v)| "  #{pad(k)} => #{v}"}.join(",\n")
  end

  def to_18
    "{%s}" % map {|a| a.join(' => ')}.join(', ')
  end

  def to_19
    "{%s}" % map {|a| format_pair(*a)}.join(', ')
  end

  def each
    return to_enum unless block_given?
    @hash.map {|*a| yield a.flat_map(&method(:to_ruby))}
  end

  private

  def format_pair(k, v)
    if k =~ /\A:[a-z0-9A-Z]+\z/
      "%s: %s" % [k[1..-1], v]
    else
      "%s => %s" %  [k, v]
    end
  end

  def pad(key)
    "%-#{max}s" % key
  end

  def max
    @max ||= map {|a| a[0].length}.max
  end

  def to_ruby(sexp)
    sexp = sexp.deep_clone
    @r2r.process(sexp)
  end

  def parse(string)
    sexp = @parser.process(string)
    raise "Not a hash." unless sexp.shift == :hash
    Hash[*sexp]
  end
end
