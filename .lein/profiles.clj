{:user {:dependencies [[org.clojure/tools.namespace "1.1.0"]
                       [org.clojure/tools.trace "0.7.11"]
                       [clj-kondo "2021.03.22"]]
        :plugins [[lein-ancient "0.7.0"]
                  [lein-cljfmt "0.7.0"]
                  [lein-kibit "0.1.8"]
                  [lein-ring "0.12.5"]
                  [lein-pprint "1.3.2"]]
        :aliases {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}
 :repl {:plugins [[cider/cider-nrepl "0.25.9"]]}}
