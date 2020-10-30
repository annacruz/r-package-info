# frozen_string_literal: true

require 'gzipped_tar'
require 'open-uri'
class PackageService
  def self.get_package_list
    all_packages_url = 'http://cran.r-project.org/src/contrib/PACKAGES'
    
    response = URI.open(all_packages_url).read
    package_list_text = response.split("\n\n")
    package_list_text = package_list_text.map {|pl| pl.split("\n")}
    package_list_text.map do |items|
      key1, value1 = items[0].split(':')
      key2, value2 = items[1].split(':')
      {key1 => value1.strip, key2 => value2.strip}
    end
  end

  def self.get_package_description(package_hash)
    base_url = 'http://cran.r-project.org/src/contrib/'
    tar_url = base_url + package_hash["Package"] + "_" + package_hash["Version"] + ".tar.gz"

    reader = GZippedTar::Reader.new URI.open(tar_url).read

    description = reader.read("#{package_hash["Package"]}/DESCRIPTION").split("\n")
    description.each_with_index do |item, index|
      if item.start_with? "  "
        description[index - 1].concat(" #{item.strip}")
        description.delete_at(index)
      end
    end
    description.map do |item|
      key, value = item.split(':')
      {key => value.strip}
    end.reduce(:merge)
  end

end
