'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "eb1c439a50bbb61a2795adc4c081f5de",
"assets/AssetManifest.bin.json": "660b44697826a4dcfe45ed7928d5b69d",
"assets/AssetManifest.json": "367f52ba80a92d924c8d682d48702968",
"assets/assets/data/metadata/articles.json": "bd7b5d2e637db67d0d8d76413b83acf9",
"assets/assets/data/metadata/types/development.json": "3515a4f7114c9a714a55e6110b63a74a",
"assets/assets/data/metadata/types/metadata.json": "92c67b0baa92156b8be4134cbae9d747",
"assets/assets/data/metadata/types/operations.json": "6307f64217022de3bbb17f67040e289c",
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
"flutter_bootstrap.js": "2ea33111ac58f632dd77e48c87903a08",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "21b8109b22272259bb1ef1d0fe4eed2a",
"/": "21b8109b22272259bb1ef1d0fe4eed2a",
"main.dart.js": "a28daf9046834a3914c0b0ec7788fe6c",
"manifest.json": "861724881b0331a3108426e7f7c4cac6",
"version.json": "9587905783458e6aaea9643059cd70c6"};
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
