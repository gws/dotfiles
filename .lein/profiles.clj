{:user {:dependencies [[org.clojure/tools.namespace "1.2.0"]
                       [org.clojure/tools.trace "0.7.11"]
                       [clj-kondo "2022.02.09"]]
        :plugins [[lein-ancient "0.7.0"]
                  [lein-cljfmt "0.8.0"]
                  [lein-kibit "0.1.8"]
                  [lein-ring "0.12.6"]
                  [lein-pprint "1.3.2"]]
        :aliases {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}
 ;; 2021-10-27: 0.27.2 is broken
 :repl {:plugins [[cider/cider-nrepl "0.26.0" :upgrade false]]}}
