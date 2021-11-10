class ArtistsController < ApplicationController

def new
    @artist = Artist.new
end

def create
    artist = Artist.new(art_params(:name, :bio))
    artist.save
    redirect_to artist_path(artist)
end

def show
    @artist = Artist.find(params[:id])
end

def edit
    @artist = Artist.find(params[:id])
end

def update
    artist = Artist.find(params[:id])
    artist.update(art_params(:name, :bio))
    redirect_to artist_path(artist)
end

private
    def art_params(*arg)
        params.require(:artist).permit(*arg)
    end

end
