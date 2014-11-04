# Author::    Ernest Ellingson
# Copyright:: Copyright (c) 2005 

# These are extensions to the std-lib 'matrix' to allow an all ruby SVD

require 'matrix'
require 'mathn'

class Array
  def sum(identity = 0, &block)
    return identity unless size > 0
  
    if block_given?
      map(&block).sum
    else
      reduce(:+)
    end
  end
end

class Vector
  def magnitude
    sumsqs = 0.0
    self.size.times do |i|
      sumsqs += self[i] ** 2.0 
    end
    Math.sqrt(sumsqs)
  end
  def normalize
    nv = []
    mag = self.magnitude
    self.size.times do |i|

      nv << (self[i] / mag)

    end
    Vector[*nv]
  end
end

