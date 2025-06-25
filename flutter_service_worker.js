'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "45c9eb7fa6e6a781268f8a3b8d62d8b9",
".git/config": "920a11de313bfb8d93d81f4a3a5b71b6",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "39979d00e80dd02bbab763a7495e5bc1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "9b4fdc4edd0b23ca2d1b303c396d9385",
".git/logs/refs/heads/master": "9b4fdc4edd0b23ca2d1b303c396d9385",
".git/objects/05/19c12975bf38b00a125846f13c67d2ac16eb08": "189a91da74f3f1181fcd93c158ddb7de",
".git/objects/0d/081fb8468c175807276cb14022bdeb6a84b2f6": "ef2628e84add85f77c2f98853d3a64dd",
".git/objects/0f/769642805033eafb5d42a16be14ac7dc88a6bd": "9b533aa567d8b0bfc6e5c532db6614fc",
".git/objects/16/777548064c272fbb6f88200aaa1f5b67ed1f37": "8555dc9cff4f26270019b192f5fb424f",
".git/objects/17/9e703c0bad0986ca894d035436527cb082f5bd": "dd18b3080092d9d6d93b216b99125846",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1d/d0693d227e0dbc9d63717f45d599d9da8d6977": "36c54351591dc2dc2903b26ddecf50f5",
".git/objects/1e/8d3ffa4228fcd89aefc89d915264903cb55460": "9d36f5343cd72c16610a922653d82239",
".git/objects/22/4fe784b1fef63f179c5c21bb829a95ee68cb6f": "9d0758b3a02f37f7fc48c8790cb4b828",
".git/objects/23/0ae7dde80748f63c6e1947bfdee0e080bd3546": "785f8f9fb102c9776e5ec4d4ebc17dae",
".git/objects/29/4ee25f1ff42c03801d1ba6f13c2226cecb26df": "a58267509070b813cdc3d24e43ffaf9c",
".git/objects/32/f239c8b776828340643b4698b47c1b149c707b": "86b9631e8eda33a6167f5a2dd716b14e",
".git/objects/37/972c4316ad36a35ffa4db5b44e91154f13f559": "4cbe92c7b272d83a60ae400c2a8e0e42",
".git/objects/3a/7c2aa9eb1df12e88b237db5bd9c91507f13092": "657ec3a620bebfec61000b057ab55bd2",
".git/objects/3e/4f9f5309cfff331df59c9b3fdd0da236dca4aa": "7142a83d0af6a88103365c91d0262d00",
".git/objects/42/ea9759e472c9818f85b9c474484389b840af03": "c6c6bcd8c6726ff624befbc3c66d8b33",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/55/cf43ee0b7e40fe6c1b7d7e64337e9d7e57f738": "5bb1976f3862b4022d6ac92c45d20afa",
".git/objects/57/951bf70e8e082c42aaac3e737d5b5ab470e566": "1d8e6a7ffa89013cf0e68159fe8053e9",
".git/objects/58/4d6a403a1931d200c543ce9368620a280bacef": "734b171506fd5ea9b221401cd3a4bf4b",
".git/objects/5b/50fa9671575c5e9b10c6bc9d1e8f1b87199710": "901a787f6ef36fce180a608a7ae6e380",
".git/objects/5c/37f8f4befe7fdd46b21eee92508094d20f9281": "b2407af8d28d20dff5947cbbe7d1eaa4",
".git/objects/5c/c1f77770052050270960b143b68a0fc49caca9": "5d5463c744bbc3498efdce06d0f94483",
".git/objects/5d/06b1bd493afd9063e00a15b6578a94366f0090": "b22c023c1dafe5f5fdc0ff8dd291aea5",
".git/objects/5d/8c297a642de2d6f9fbea0c300b73e408ab350b": "d7c59dc6d1a4cb038fdff3b72fcd11dc",
".git/objects/63/1dd545e9014da68eefede0724a7d10c6c4d63b": "a5a427f12cf368341e533a3f1a681d6e",
".git/objects/68/1d54c52ddde2ab5778f2030795088c88085f6c": "133e6c95b2c25ed483a49562a13bdc13",
".git/objects/6a/c8295b9fb59fe37c89c59ae633aac481e466fe": "ea5f2b3b1e1bc3257926ad6a7c8cd9b0",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6d/fcee5384dd21463958e26db648a86e6ad342c7": "21a6683735ece0559798d87b19785c67",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/4877c5f7a702e3a67090383744c2f121b17745": "585d80638cba0bad29b8da48fcb94840",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/78/aa1401c91ab71e6d59a0f78a3bb5810e0955f0": "50ff0ef17fd5b16cc1cee4d86afdb25b",
".git/objects/79/8bf22b8415075c49991499dafe33234a00ea8e": "6c2e303ec4ef35ab367a26ae91caabe9",
".git/objects/7a/54bf71a0c89f76ab1ae5cd0c5342e03819b61c": "86056fecdf53c7db6e753b025450ec64",
".git/objects/7a/76c38ece03bc4da09de6eaa1f9781199b0094c": "349fce6428392bbcd3dbcb2d8d426fdd",
".git/objects/7a/bfa13e8e2ddcd7f8a06c4c58b15eb09aafd1b9": "dae44492663994bf42d30587a2189033",
".git/objects/7b/c53fa30a5c3c54d8fb2d06bfaec638f7c1fa96": "9a78e7fabc4d7ad3cc53cadc5fd4fbd1",
".git/objects/7f/a7faf1179c39452b33373df65015ad5de2d3e1": "c3af6118914e08f10d019ed3491427f0",
".git/objects/80/1dae4758d442c24ee569fde67ca57a2dd7d4a0": "febe8e6edd904d099d64b34125c82620",
".git/objects/80/9b497fc36ab11753bf753d3904e1d453b7e283": "146d14cc9fc766f8d8ebff5912a40651",
".git/objects/84/c66844316af7c025c9ae2138b1b3c8da69483a": "e0db835ae9f0293fd598d4c0d28c0272",
".git/objects/88/99789645ebbb8cf95d0d53ca0a139b436cd913": "fdaea3ffcf37a67a6e943bc7c4fc3243",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8d/e1cc74195568b433ab3ce4d68662bec28507eb": "f1451d5165e8e489c4e74f94209ad598",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/8e/bbbc90be2a2d3aabf830a8ab3f50064739c930": "9d0e526929b757af04933194c49b093c",
".git/objects/91/82582c9a6b7c6785e6f6edc10a9126467bce52": "ac18939cc31554260b9d43046d9107ec",
".git/objects/92/ca409c28ef847658383bbe35e87dd78847a6c5": "7186d0fc825f98c6a15e132ee6fa68e1",
".git/objects/96/cce4b9d7dc5d8033aabd997f1258e78b7ededc": "99fc47bc7d646b0d5ca42fe889a757d0",
".git/objects/9a/329b3869df94d87541d9cab2fd2b460a0324ed": "4962dca122476f55d03baeb678f72407",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/a3/d71c378837d6041c5ff4894ac5cd47eca00416": "b5beefa704ad3301461d4de5f7cf4b33",
".git/objects/a4/3b2fd61f73b56fb9378278122c0f584543750f": "71d9449b657fc31f423b509365954a3d",
".git/objects/a7/0dded7b70bdea028e652d94935088036a199d0": "b0b698f468a4def958a162cb7eef8f0e",
".git/objects/a7/32f8aa34730f2cf3e625877f49f0c93732150e": "b9b2b493d1e3f7424a867d3baf5b665d",
".git/objects/a7/d18ea9a43783839fc22ff61ab2ab2044d0d26b": "9ee9a77047d74a5dc7a2e6ad3b48313b",
".git/objects/ae/8eac99fb60541506251426ce7db125a12a651e": "46e108284c5892cad810373469d1f626",
".git/objects/b1/1ef482612dc3af6a89b18f485d435073cb96fd": "3f50953e9e7f6ffb4aa5672d3db0b594",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/ebaad2c5408b18b1f10a1dd267d87d77e29d32": "a5c339c78ece573d95748dd1180a6a78",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/bc/d2615ec15761cf42f97ade104f7d40c9430cac": "58d71b4a500f2f560d2853c396403265",
".git/objects/c2/a20f0e9d5ed23620c094875c6675654b04b030": "e204564d23af59d5bb1ff397941a8345",
".git/objects/c5/fb5f2dcdb06f691bda97820c3109aec2963be4": "2948c939b8176e182265d60ad1df1b3b",
".git/objects/c6/4d7d95d9bf0746354a897fa43148b0b3e305ae": "82d18f9dcc56c42f597c640046b86f0d",
".git/objects/c6/6f64af7f9f226ece8636751d4a4113e3dd6c3b": "bfa096781299317d81f241bb96d7915f",
".git/objects/c7/6cef8ba63d056609902167cbfd244e0db7b432": "f0d2862c2628448a3bffaf65cbae80f3",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/ca/f5f4051123a40dc2488c7a04d085cf60c8b799": "f591bb650c7821efb13ab3457dd102f4",
".git/objects/ce/21f6e16288eef5dbf3574eaea2b2d6e1102bfc": "a5a2078da56bc37580db7693adaab470",
".git/objects/ce/bbfc26387b00dc3c928bbe0f264dc7b60fb853": "636e79704a68860e4d1a71abfd368157",
".git/objects/d0/16c7ba28889a66e6fff95c1f1058047d5ff7c4": "5c814435727b52ba7392077822f6d248",
".git/objects/d0/16d667f5bfd5d44c1b03116209773ace58e9c2": "cd5d82fdc97d7ad403abd2abe65256ff",
".git/objects/d0/944ff5803a44f79fea47068086be330c07ec2c": "28e188795a13bd37b7b530a5b640a209",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/db/ba236a9aecc979599e6643eb423f6a26d61a10": "6af08d2ef781a7be83207dff06d11b80",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/de/53ec70e0ea32da55d1cbde76961b8a00d17bd4": "f165580d8854e35cb5e5e5164cf46757",
".git/objects/de/91955e9aca31f1e9a9d1bba19dfbeba007ff60": "f8a25107a1d395ee6cee36147dcc2781",
".git/objects/e0/46abfc0fc3664dba270f85cc645927765700c0": "a1cea5e55383ca4638870f88928e746c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e2/8651b802892a868b3c5d2086b57eab3833a887": "02d9f719c78b1249d1282b8d8410f3db",
".git/objects/e6/c2be5f854bdbce66b7ab85dcef781a63c77d5d": "5dbc4ed173c5f17e81f0cefbf8d1639c",
".git/objects/e7/4c9231c21768e41105c2ae3061f374ba53765a": "e7e591ef4f10449778a3bf228213aa4d",
".git/objects/e7/a6e4ea027cdb710624e2de144043fe6435b29e": "de1868e85af868bf5f77b0bc50756c3d",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/a9f1e845bb62004fc3c888eba03b5aa2e785a9": "7e5e5bc77ff3b7c376633f677959fc0b",
".git/objects/f0/b6d32a8141cb0c457084e51cbed0cf9307edc8": "0b6b197828e963eb4dd9857e3705f848",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/3712c50832acd8c7e6279d0bb5149d44c33b96": "8f5d9476b28523987bb62437fd46b8fe",
".git/objects/f3/d920c3d07fd247dd3c5218c40f534ee60336ff": "71781047d73846bec667ec22f39dc8f8",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f7/8733b31980ee53fd0a6c3a8d68b1333655e20a": "1a5e271f25e30879fc64e490edf622c4",
".git/objects/fa/6df494632212a47859c54f83aa03f050ff93b6": "36088b64225cdc0b322488baa7c41486",
".git/objects/fa/81b1378c97853bb8b238c68e6b365398c83b62": "5abf7938318687a6959b1c10d21ac010",
".git/objects/fc/075da1f88af8ef5a01bbc04afd400fe384df91": "33c82b12467043ec36dd133786ef3533",
".git/objects/fd/ab35a70bc19688ce84169804f583884044eb55": "57aa20984dc4cab5e336b3b2988db2b3",
".git/objects/fd/bf05b6be3b6b2627d6197a3cb13db673990f98": "9dabdd610f1f9c64918f91ac11ca92f5",
".git/objects/ff/6af6be46edf5531d758fe3a32a087089daa728": "a0c606ab00c81fb06b3808a0f9778e78",
".git/refs/heads/master": "6a0f2aa26f9c67ae758adb17f3937194",
"assets/AssetManifest.bin": "b56026faa932e5e2fb917ffd8664b892",
"assets/AssetManifest.bin.json": "7803b17248605063ee2463ca8b426cc6",
"assets/AssetManifest.json": "5795aa8cb3bfa3ace209123fd2639b7f",
"assets/assets/data/metadata/articles.json": "bd7b5d2e637db67d0d8d76413b83acf9",
"assets/assets/data/metadata/types/development.json": "b3ae85c537b6fd5f87b8c6176590f5db",
"assets/assets/data/metadata/types/metadata.json": "92c67b0baa92156b8be4134cbae9d747",
"assets/assets/data/metadata/types/operations.json": "6307f64217022de3bbb17f67040e289c",
"assets/assets/data/metadata/types/querystore.json": "79621cd592b9f985415734126afe31b5",
"assets/assets/data/metadata/types/tests.json": "d1f9199eddde6f718af712feadea5e6f",
"assets/assets/data/other/dummy_html_input.html": "ccc49307e3d9c2917556b9ff47e975c7",
"assets/assets/data/sqls/dev/delete_1.sql": "2373d9dead8fc17ab9c04e186c90ac48",
"assets/assets/data/sqls/dev/index_1.sql": "d24486bccfadfac7f522e2912c8bebb3",
"assets/assets/data/sqls/dev/index_dynamic_drop.sql": "9e5d18e032255e0d3c003b59d377a89f",
"assets/assets/data/sqls/dev/template_recreate_clustered_index_1.sql": "6b4f95d067f3fdf5cbf3e4a2909fc5fc",
"assets/assets/data/sqls/metadata/metadata_foreign_keys_1.sql": "72ba436dd6f7bc539ab15e4bd92f5ecb",
"assets/assets/data/sqls/metadata/metadata_index_1.sql": "32b62f0c31cee2331bb72406d2a40ec4",
"assets/assets/data/sqls/metadata/metadata_index_2.sql": "5ca6a28e876fac87dc5755243de9b20c",
"assets/assets/data/sqls/metadata/metadata_views_1.sql": "2f16d1791a34a4577f1003186ef4a8e2",
"assets/assets/data/sqls/ops/opened_transactions_1.sql": "1120602abd2da25e0fdd1e8c03f33837",
"assets/assets/data/sqls/ops/size_1.sql": "627b5760b104520bed311576b38239e8",
"assets/assets/data/sqls/ops/stats_1.sql": "84cd8678d83874c11a4eb74ac770a55e",
"assets/assets/data/sqls/ops/stats_view_remix_1.sql": "0ad94b2de72e2631a125c7f1923180c1",
"assets/assets/data/sqls/ops/waits_1.sql": "51cd671518bfc16e671529e2efb7c2b7",
"assets/assets/data/sqls/querystore/query_store_dump_1.sql": "14a9e1f8cd5ca4f822fc12bda1cc7176",
"assets/assets/data/sqls/tests/rcsi_frag.sql": "303859410b66ef559da9a9f16618b705",
"assets/assets/images/eye.png": "6508119d80d21681e51fbe31af768bf8",
"assets/assets/images/gifs/0.gif": "211a3ab7f886c5696b954d4c1c38ca40",
"assets/assets/images/gifs/1.gif": "28b8ddfb8f331b0d05ddae50e271aee4",
"assets/assets/images/gifs/2.gif": "4383e006e53874db32a8987940985ab9",
"assets/assets/images/gifs/3.gif": "2138c919e1c9003c4f16e052b8a6ae25",
"assets/assets/images/gifs/4.gif": "eca2507079af6821586604f7d607211d",
"assets/assets/images/gifs/5.gif": "b5038fac5544ac3ef05a872dc886fc12",
"assets/assets/images/gifs/6.gif": "f942525622acfa8c00fb7126f7edc198",
"assets/assets/images/icons/ic_about.png": "63b74f2509223853a4d76f73f67b9366",
"assets/assets/images/icons/ic_chaos.png": "0dfc2c94c2c7905f78605ea4327f2028",
"assets/assets/images/icons/ic_gospel.png": "8e69c27f6f35deec6eb9fff11b6d876f",
"assets/assets/images/icons/ic_posters.png": "d71c17cee0c1a2d541f46662b30aa0ec",
"assets/assets/images/icons/ic_rad.png": "70bea8a5ce0c27a823f7d425af69fad0",
"assets/assets/images/posters/Attak_1.png": "d38a272402ee6c30ea6206b0de6fcca5",
"assets/assets/images/posters/Attak_2.png": "13626e0784ce50d90d6ffd83bfa0b141",
"assets/assets/images/posters/Blue.png": "5caa8da594aae85d84a00585d33c5159",
"assets/assets/images/posters/Coil_Saves.png": "4fd57dc1953f78a1994e4da0356b9adc",
"assets/assets/images/posters/Disturb.jpg": "a3f764ed4cbfba88c865812dfc23743a",
"assets/assets/images/posters/Easy.png": "6113ad0aaac81b3f9a101c78765b2ebb",
"assets/assets/images/posters/Fonder_1.png": "407c7ac321b6923a3e5c97c1b99ddb7c",
"assets/assets/images/posters/Fonder_2.png": "7be93c471ab3e24e96eeb636b5b83bd1",
"assets/assets/images/posters/NSFW.png": "0c1f81771aa9e20330a8bdc059c41017",
"assets/assets/images/posters/SP_1.jpg": "5e5bb0487ce7aeeac6318222d348b52a",
"assets/assets/images/posters/SP_2.jpg": "c6371bafcde4a30e2ac7418993994fc5",
"assets/assets/images/posters/Vanishing.png": "c214814098acb36724b7caa211cd5d7e",
"assets/assets/images/posters/Violence.png": "bd8687c49c6ad9398ad42a953aa284d3",
"assets/assets/images/posters/Where.png": "aad0202b3b578b4b6deab662931fb7fd",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "97bc602daca8f147c65a1bce68fb81fb",
"assets/NOTICES": "b30cbb301efbb05e6b2cbb6484e2f7f7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.ico": "c5d22ce53325f781d59b620951fd4778",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "215579408b3526cdd09d759ba66c3b70",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6c2e8ee6d04f97e80b1c584e87e802a9",
"/": "6c2e8ee6d04f97e80b1c584e87e802a9",
"main.dart.js": "28d6e87bb7dce13e7528a573c3621876",
"manifest.json": "861724881b0331a3108426e7f7c4cac6",
"version.json": "9587905783458e6aaea9643059cd70c6",
"_config.yml": "b4d2514c2ba1032ce760684ff10b97c4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
