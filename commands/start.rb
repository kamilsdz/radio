module Commands
  class Start
    PLAYLIST_NAME = "WC playlist"

    def call
      system("spt play --name \"#{PLAYLIST_NAME}\" --playlist --random")
    end
  end
end
