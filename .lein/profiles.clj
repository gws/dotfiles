{:user {:dependencies [[org.clojure/tools.namespace "1.1.0"]
                       [org.clojure/tools.trace "0.7.10"]
                       [clj-kondo "2020.12.12"]]
        :plugins [[lein-ancient "0.6.15"]
                  [lein-cljfmt "0.7.0"]
                  [lein-kibit "0.1.8"]
                  [lein-ring "0.12.5"]
                  [lein-pprint "1.3.2"]]
        :aliases {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}
 :repl {:plugins [[cider/cider-nrepl "0.25.6"]]}}
