require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class PageTest < Minitest::Test
  SITE_DIR = 'myblog'

  def setup
    @wd = Dir.getwd
    Dir.chdir __dir__
  end

  def teardown
    FileUtils.rm_rf SITE_DIR
    Dir.chdir @wd
  end

  def test_using_slim_with_jekyll
    output = `jekyll new #{SITE_DIR}`
    assert_match /New jekyll site installed in/, output
    assert Dir.exist? SITE_DIR
    Dir.chdir(SITE_DIR) do
      Bundler.with_clean_env do
        build_output = `bundle exec jekyll build`
        assert_match /done in/, build_output
      end
    end
  end
end