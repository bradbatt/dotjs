# encoding: utf-8

module FixtureHelpers
  def read_fixture(name)
    File.read(
      File.join(
        File.expand_path(
          File.join('spec/fixtures', name))))
  end
end
