name              "chef-create-db"
maintainer        "Rupyshev Vladimir"
maintainer_email  "telrayru@gmail.com"
description       "Create default db in postgresql"
version           "0.0.4"

recipe "chef-create-db", "create db"

supports "ubuntu"

depends "database"
