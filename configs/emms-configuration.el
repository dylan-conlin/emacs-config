(require 'emms-setup)
(require 'emms-player-mpd)
(require 'emms-player-vlc)
(require 'emms-browser)
(require 'emms-history)
(require 'emms-info-libtag)
(require 'emms-mark)
(emms-standard)
(add-to-list 'emms-player-list 'emms-player-mpd)
(emms-all)

(emms-default-players)
(emms-history-load)
(setq emms-info-functions '(emms-info-libtag))


(setq emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music")

(define-emms-simple-player mplayer '(file url)
  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
		".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
		".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

(setq emms-track-description-function 'fg-emms-track-description)

(provide 'emms-configuration)
