require_relative './extended_file/reader'
require_relative './extended_file/writer'
require_relative './configuration'
require_relative './translator/factory'

module Algorithm
  class Algorithm

    def initialize fichier
      @file_name = fichier
      raise "No file passed ad parameter" if @file_name.nil?
      raise "File passed as parameter is incorrect. Check your path" unless File.file? @file_name

      @output_file_name = generate_script_name
      @writer = ExtendedFile::Writer.new @output_file_name
      @reader = ExtendedFile::Reader.new @file_name
    end

    def run
      process_file
      launch_script
    end

    private

    def process_file
      output_language = Configuration.instance["output_language"]
      Translator::Factory::create_translator(output_language).process_file @writer, @reader
    end

    def launch_script
      executable_path = Configuration.instance["executable_path"]
      puts "Generated script is available. You can run it on this way:"
      puts "  #{executable_path} #{@output_file_name}"
    end

    def generate_script_name
      alphabet = ('a'..'z').to_a
      random = 10.times.map{ alphabet[rand(alphabet.length)] }.join
      "#{@file_name}_generate_#{random}"
    end

  end
end

