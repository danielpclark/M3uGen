class M3uGen
  def initialize(path = '/'); @path = path; end
  def path=(path); @path = path; end
  def path; @path; end

  def parse_dir(dir = @path)
    result = {}
    Dir.glob("#{dir}/**/*.mp3").map {|path|
      m3u = "#{path.split('/')[-2].gsub(' ','_').downcase}.m3u"
      result[m3u] = Hash(result[m3u]).update({
        title: path.split('/')[-2] || "Unsorted",
        files: Array(Hash(result[m3u])[:files]).<<({
          path: path,
          filename: path.split('/').last
        })
      })
    }
    result
  end
end
