{:user {:aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :dependencies [[org.clojure/tools.namespace "0.2.10"]
                       [org.clojure/tools.trace "0.7.9"]
                       [slamhound "1.5.5"]]
        :plugins [[jonase/eastwood "0.2.3"]
                  [lein-ancient "0.6.10"]
                  [lein-cljfmt "0.5.3"]
                  [lein-kibit "0.1.2"]
                  [lein-ring "0.9.7"]
                  [lein-pprint "1.1.2"]]
        :signing {:gpg-key "0x5D5F3485F7935DE0"}}}