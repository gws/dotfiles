{:user {:dependencies [[org.clojure/tools.namespace "0.3.1"]
                       [org.clojure/tools.trace "0.7.10"]
                       [clj-kondo "2019.12.14"]]
        :plugins [[lein-ancient "0.6.15"]
                  [lein-cljfmt "0.6.6"]
                  [lein-exec "0.3.7"]
                  [lein-kibit "0.1.8"]
                  [lein-ring "0.12.5"]
                  [lein-pprint "1.2.0"]]
        :aliases {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}
 :repl {:plugins [[cider/cider-nrepl "0.22.4"]]}}
