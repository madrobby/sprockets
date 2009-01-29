module Sprockets
  class Packer
    attr_reader :output_file
    
    def initialize(source)
      @output_file = IO.popen "java -jar #{File.dirname(__FILE__)}/yuicompressor-2.4.1.jar --type js", "r+" do |compressor|
        compressor.puts(source)
        compressor.close_write
        compressor.readlines.map {|line| line.chomp}
      end.join("\n")
    end
  end
end