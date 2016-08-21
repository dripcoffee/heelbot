require "helper"
require_relative "../heelspec/aqi"

class TestSpecAqi < Minitest::Test
  context "heelspec of aqi" do
    setup do
      @klass = Heelspec::Aqi.new
    end

    should "initialize with properties" do
      assert_equal("AQI Query", @klass.name)
    end

    should "print error message if no city input" do
      assert_output("Error: Cannot get param #0\nError: no city input\n") {
        @klass.run(nil)
      }
    end

    should "show aqi if validate city input" do
      output_prefix = "AQI of 北京 is"
      output = Heel::Util.capture_stdout do
        @klass.run(["北京"])
      end
      assert_equal(true, output.start_with?(output_prefix))
    end

    should "show aqi not found if inexisted city input" do
      assert_output("AQI of aa is not found.\n") {
        @klass.run(["aa"])
      }
    end
  end
end