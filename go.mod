module github.com/DefiantLabs/cosmos-tax-cli

go 1.19

require (
	github.com/BurntSushi/toml v1.3.2
	// FYI, you can do go get github.com/DefiantLabs/lens@1f6f34841280df179c6e098f040bd584ced43a4c
	// (using the commit hash from github) to pin to a specific commit.
	github.com/DefiantLabs/lens v0.3.1-0.20230924162135-0717939c271c
	github.com/cosmos/cosmos-sdk v0.47.4
	github.com/gin-gonic/gin v1.9.1
	github.com/go-co-op/gocron v1.13.0
	github.com/imdario/mergo v0.3.13
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/shopspring/decimal v1.3.1
	github.com/spf13/cast v1.5.1 // indirect
	github.com/spf13/cobra v1.7.0
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.16.0
	github.com/stretchr/testify v1.8.4
	github.com/tendermint/tendermint v0.37.0-rc1
	google.golang.org/grpc v1.57.0 // indirect
	google.golang.org/protobuf v1.31.0 // indirect
	gorm.io/driver/postgres v1.3.1
	gorm.io/gorm v1.23.6
)

require (
	github.com/cosmos/ibc-go/v4 v4.3.1
	github.com/go-git/go-git/v5 v5.9.0
	github.com/osmosis-labs/osmosis/v19 v19.0.0
	github.com/preichenberger/go-coinbasepro/v2 v2.1.0
	github.com/rs/zerolog v1.27.0
	github.com/swaggo/files v1.0.0
	github.com/swaggo/gin-swagger v1.5.3
	github.com/swaggo/swag v1.8.10
)

require (
	cosmossdk.io/errors v1.0.0 // indirect
	cosmossdk.io/math v1.1.2 // indirect
	dario.cat/mergo v1.0.0 // indirect
	filippo.io/edwards25519 v1.0.0-rc.1 // indirect
	github.com/99designs/keyring v1.2.1 // indirect
	github.com/ChainSafe/go-schnorrkel v1.0.0 // indirect
	github.com/CosmWasm/wasmd v0.31.0 // indirect
	github.com/CosmWasm/wasmvm v1.2.1 // indirect
	github.com/KyleBanks/depth v1.2.1 // indirect
	github.com/Microsoft/go-winio v0.6.1 // indirect
	github.com/ProtonMail/go-crypto v0.0.0-20230828082145-3c4c8a2d2371 // indirect
	github.com/PuerkitoBio/purell v1.1.1 // indirect
	github.com/PuerkitoBio/urlesc v0.0.0-20170810143723-de5bf2ad4578 // indirect
	github.com/Workiva/go-datastructures v1.0.53 // indirect
	github.com/acomagu/bufpipe v1.0.4 // indirect
	github.com/armon/go-metrics v0.4.1 // indirect
	github.com/avast/retry-go v3.0.0+incompatible // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bgentry/speakeasy v0.1.1-0.20220910012023-760eaf8b6816 // indirect
	github.com/btcsuite/btcd v0.22.3 // indirect
	github.com/cenkalti/backoff/v4 v4.1.3 // indirect
	github.com/cespare/xxhash v1.1.0 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/cloudflare/circl v1.3.3 // indirect
	github.com/coinbase/rosetta-sdk-go v0.7.9 // indirect
	github.com/confio/ics23/go v0.9.0 // indirect
	github.com/cosmos/btcutil v1.0.5 // indirect
	github.com/cosmos/cosmos-proto v1.0.0-beta.3 // indirect
	github.com/cosmos/go-bip39 v1.0.0 // indirect
	github.com/cosmos/gogoproto v1.4.11 // indirect
	github.com/cosmos/gorocksdb v1.2.0 // indirect
	github.com/cosmos/iavl v0.19.5 // indirect
	github.com/cosmos/ledger-cosmos-go v0.12.2 // indirect
	github.com/creachadair/taskgroup v0.3.2 // indirect
	github.com/cyphar/filepath-securejoin v0.2.4 // indirect
	github.com/danieljoos/wincred v1.1.2 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/desertbit/timer v0.0.0-20180107155436-c41aec40b27f // indirect
	github.com/dgraph-io/badger/v3 v3.2103.2 // indirect
	github.com/dgraph-io/ristretto v0.1.0 // indirect
	github.com/docker/distribution v2.8.2+incompatible // indirect
	github.com/dustin/go-humanize v1.0.1-0.20200219035652-afde56e7acac // indirect
	github.com/dvsekhvalnov/jose2go v1.5.0 // indirect
	github.com/emirpasic/gods v1.18.1 // indirect
	github.com/felixge/httpsnoop v1.0.2 // indirect
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/gabriel-vasile/mimetype v1.4.2 // indirect
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/go-git/gcfg v1.5.1-0.20230307220236-3a3c6141e376 // indirect
	github.com/go-git/go-billy/v5 v5.5.0 // indirect
	github.com/go-kit/kit v0.12.0 // indirect
	github.com/go-kit/log v0.2.1 // indirect
	github.com/go-logfmt/logfmt v0.5.1 // indirect
	github.com/go-openapi/jsonpointer v0.19.5 // indirect
	github.com/go-openapi/jsonreference v0.19.6 // indirect
	github.com/go-openapi/spec v0.20.4 // indirect
	github.com/go-openapi/swag v0.19.15 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/go-playground/validator/v10 v10.14.0 // indirect
	github.com/goccy/go-json v0.10.2 // indirect
	github.com/godbus/dbus v0.0.0-20190726142602-4481cbc300e2 // indirect
	github.com/gogo/gateway v1.1.0 // indirect
	github.com/gogo/protobuf v1.3.3 // indirect
	github.com/golang/glog v1.1.1 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/google/btree v1.1.2 // indirect
	github.com/google/flatbuffers v2.0.8+incompatible // indirect
	github.com/google/go-cmp v0.5.9 // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/google/orderedcode v0.0.1 // indirect
	github.com/gorilla/handlers v1.5.1 // indirect
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/gorilla/websocket v1.5.0 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway v1.16.0 // indirect
	github.com/gsterjov/go-libsecret v0.0.0-20161001094733-a6f4afe4910c // indirect
	github.com/gtank/merlin v0.1.1 // indirect
	github.com/gtank/ristretto255 v0.1.2 // indirect
	github.com/hashicorp/go-immutable-radix v1.3.1 // indirect
	github.com/hashicorp/golang-lru v0.5.5-0.20210104140557-80c98217689d // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/hdevalence/ed25519consensus v0.0.0-20220222234857-c00d1f31bab3 // indirect
	github.com/improbable-eng/grpc-web v0.15.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/jackc/chunkreader/v2 v2.0.1 // indirect
	github.com/jackc/pgconn v1.10.1 // indirect
	github.com/jackc/pgio v1.0.0 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgproto3/v2 v2.2.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20200714003250-2b9c44734f2b // indirect
	github.com/jackc/pgtype v1.9.1 // indirect
	github.com/jackc/pgx/v4 v4.14.1 // indirect
	github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.4 // indirect
	github.com/jmhodges/levigo v1.0.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/kevinburke/ssh_config v1.2.0 // indirect
	github.com/keybase/go-keychain v0.0.0-20190712205309-48d3d31d256d // indirect
	github.com/klauspost/compress v1.15.11 // indirect
	github.com/leodido/go-urn v1.2.4 // indirect
	github.com/lib/pq v1.10.9 // indirect
	github.com/libp2p/go-buffer-pool v0.1.0 // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mailru/easyjson v0.7.6 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.19 // indirect
	github.com/mimoo/StrobeGo v0.0.0-20220103164710-9a04d6ca976b // indirect
	github.com/minio/highwayhash v1.0.2 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/mtibben/percent v0.2.1 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/osmosis-labs/osmosis/osmomath v0.0.6 // indirect
	github.com/osmosis-labs/osmosis/osmoutils v0.0.6 // indirect
	github.com/osmosis-labs/osmosis/x/epochs v0.0.2 // indirect
	github.com/pelletier/go-toml/v2 v2.0.8 // indirect
	github.com/petermattis/goid v0.0.0-20220331194723-8ee3e6ded87a // indirect
	github.com/pjbgf/sha1cd v0.3.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_golang v1.16.0 // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/prometheus/common v0.42.0 // indirect
	github.com/prometheus/procfs v0.10.1 // indirect
	github.com/rakyll/statik v0.1.7 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475 // indirect
	github.com/regen-network/cosmos-proto v0.3.1 // indirect
	github.com/robfig/cron/v3 v3.0.1 // indirect
	github.com/rs/cors v1.8.2 // indirect
	github.com/sasha-s/go-deadlock v0.3.1 // indirect
	github.com/sergi/go-diff v1.1.0 // indirect
	github.com/skeema/knownhosts v1.2.0 // indirect
	github.com/spf13/afero v1.9.5 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/subosito/gotenv v1.4.2 // indirect
	github.com/syndtr/goleveldb v1.0.1-0.20210819022825-2ae1ddf74ef7 // indirect
	github.com/tendermint/btcd v0.1.1 // indirect
	github.com/tendermint/crypto v0.0.0-20191022145703-50d29ede1e15 // indirect
	github.com/tendermint/go-amino v0.16.0 // indirect
	github.com/tendermint/tm-db v0.6.8-0.20220506192307-f628bb5dc95b // indirect
	github.com/tidwall/btree v1.6.0 // indirect
	github.com/ugorji/go/codec v1.2.11 // indirect
	github.com/xanzy/ssh-agent v0.3.3 // indirect
	github.com/zondax/hid v0.9.1 // indirect
	github.com/zondax/ledger-go v0.14.1 // indirect
	go.etcd.io/bbolt v1.3.6 // indirect
	go.opencensus.io v0.24.0 // indirect
	golang.org/x/crypto v0.13.0 // indirect
	golang.org/x/exp v0.0.0-20230811145659-89c5cff77bcb // indirect
	golang.org/x/mod v0.12.0 // indirect
	golang.org/x/net v0.15.0 // indirect
	golang.org/x/sync v0.3.0 // indirect
	golang.org/x/sys v0.12.0 // indirect
	golang.org/x/term v0.12.0 // indirect
	golang.org/x/text v0.13.0 // indirect
	golang.org/x/tools v0.13.0 // indirect
	google.golang.org/genproto v0.0.0-20230803162519-f966b187b2e5 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20230726155614-23370e0ffb3e // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230815205213-6bfd019c3878 // indirect
	gopkg.in/ini.v1 v1.67.0 // indirect
	gopkg.in/warnings.v0 v0.1.2 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	nhooyr.io/websocket v1.8.7 // indirect
)

replace (
	github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76
	github.com/ChainSafe/go-schnorrkel => github.com/ChainSafe/go-schnorrkel v0.0.0-20200405005733-88cbf1b4c40d
	github.com/CosmWasm/wasmd => github.com/osmosis-labs/wasmd v0.31.0-osmo-v16
	// Security patch for wasmvm. See https://github.com/CosmWasm/advisories/blob/main/CWAs/CWA-2023-002.md
	github.com/CosmWasm/wasmvm => github.com/CosmWasm/wasmvm v1.2.3
	// dragonberry
	github.com/confio/ics23/go => github.com/cosmos/cosmos-sdk/ics23/go v0.8.0
	// Our cosmos-sdk branch is:  https://github.com/osmosis-labs/cosmos-sdk, current branch: v16.x. Direct commit link: https://github.com/osmosis-labs/cosmos-sdk/commit/ed4eb883f2a65bd5343e9d2f6186060f45294cb2
	github.com/cosmos/cosmos-sdk => github.com/osmosis-labs/cosmos-sdk v0.45.0-rc1.0.20230703010110-ed4eb883f2a6

	// N.B. v0.19.5 contains a breaking change to the IAVL API
	github.com/cosmos/iavl v0.19.5 => github.com/cosmos/iavl v0.19.4
	github.com/gin-gonic/gin => github.com/gin-gonic/gin v1.8.1
	// use cosmos-compatible protobufs
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1
	github.com/jhump/protoreflect => github.com/jhump/protoreflect v1.9.0

	// Informal Tendermint fork
	github.com/tendermint/tendermint => github.com/informalsystems/tendermint v0.34.24
	// use grpc compatible with cosmos protobufs
	google.golang.org/grpc => google.golang.org/grpc v1.33.2

)
