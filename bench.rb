require 'benchmark/ips'
require 'minitest'
require_relative 'simple_linked_list_test'

$LOAD_PATH.unshift __dir__

files = Dir.glob(File.join(__dir__, 'submissions', '*.rb'))

files.shuffle.each do |f|
  msg = " #{File.basename f, '.rb'} ".center(50, '*')
  puts msg
  load f
  Benchmark.ips do |x|
    x.report { Minitest.run }
  end
  Object.send :remove_const, :Element
  Object.send :remove_const, :SimpleLinkedList
  puts msg
end
