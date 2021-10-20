module Commands
  class Stop
    def call
      system("spt playback --toggle")
    end
  end
end
