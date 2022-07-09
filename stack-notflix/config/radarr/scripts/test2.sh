#!/bin/bash
RADARRENVLOG="../logs/pathtoalog.log"

echo $(date) >> $RADARRENVLOG
echo $radarr_eventtype	>>  $RADARRENVLOG
if [[ $radarr_eventtype == "Grab" ]] ; then
	echo "radarr_eventtype $radarr_eventtype // Event Type
	radarr_movie_id $radarr_movie_id // Internal ID of the movie
	radarr_movie_imdbid $radarr_movie_imdbid // IMDb id for the movie
	radarr_movie_title $radarr_movie_title // Title of the movie
	radarr_movie_tmdbid $radarr_movie_tmdbid // TMDb ID for the movie
	radarr_release_indexer $radarr_release_indexer // Indexer where the release was grabbed
	radarr_release_quality $radarr_release_quality // Quality name from Radarr
	radarr_release_qualityversion $radarr_release_qualityversion // 1 is the default, 2 for proper, 3+ could be used for anime versions
	radarr_release_releasegroup $radarr_release_releasegroup // Release Group, will not be set if it is unknown
	radarr_release_size $radarr_release_size // Size of the release reported by the indexer
	radarr_release_title $radarr_release_title // NZB/Torrent title
	radarr_download_client $radarr_download_client // NZB/Torrent downloader client
	radarr_download_id $radarr_download_id // The hash of the torrent/NZB file downloaded (used to uniquely identify the download in the download client)" >> $RADARRENVLOG
fi
if [[ $radarr_eventtype == "Download" ]] ; then
	echo "radarr_eventtype $radarr_eventtype	// Event Type
	radarr_isupgrade $radarr_isupgrade	// True when an existing file is upgraded, otherwise False
	radarr_movie_id $radarr_movie_id // Internal ID of the movie
	radarr_movie_title $radarr_movie_title // Title of the movie
	radarr_movie_path $radarr_movie_path // Full path to the movie ( /Movie (Year)/ )
	radarr_movie_imdbid $radarr_movie_imdbid // IMDB ID for the movie
	radarr_moviefile_id $radarr_moviefile_id // Internal ID of the movie file
	radarr_moviefile_relativepath $radarr_moviefile_relativepath // Path to the movie file relative to the movie path
	radarr_moviefile_path $radarr_moviefile_path // Full path to the movie file ( /Movie (Year)/Movie (Year).mkv )
	radarr_moviefile_quality $radarr_moviefile_quality	// Quality name from Radarr
	radarr_moviefile_qualityversion $radarr_moviefile_qualityversion // 1 is the default, 2 for proper, 3+ could be used for anime versions
	radarr_moviefile_releasegroup $radarr_moviefile_releasegroup // Release group, will not be set if it is unknown
	radarr_moviefile_scenename $radarr_moviefile_scenename // Original release name
	radarr_moviefile_sourcepath $radarr_moviefile_sourcepath // Full path to the movie file that was imported
	radarr_moviefile_sourcefolder $radarr_moviefile_sourcefolder // Full path to the folder the movie file was imported from
	radarr_download_id $radarr_download_id // The hash of the torrent/NZB file downloaded (used to uniquely identify the download in the download client)" >> $RADARRENVLOG
fi
if [[ $radarr_eventtype == "Rename" ]] ; then
	echo "radarr_eventtype $radarr_eventtype // Event Type
	radarr_movie_id $radarr_movie_id // Internal ID of the movie
	radarr_movie_title $radarr_movie_title // Title of the movie
	radarr_movie_path $radarr_movie_path	Full // path to the movie
	radarr_movie_tvdbid $radarr_movie_tvdbid // TVDB ID for the movie" >> $RADARRENVLOG
fi
