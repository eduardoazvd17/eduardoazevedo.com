'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c3cd3816a39c0da79261cd5a2a54988e",
"version.json": "ef6209bf76cef73c98aee4f85c1fee62",
"index.html": "da74b9e6d0ceef182712a23d65554ad9",
"/": "da74b9e6d0ceef182712a23d65554ad9",
"main.dart.js": "87b700285e7fad33b8b8748ca32edf04",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-192.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-maskable-192.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-maskable-512.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-512.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"manifest.json": "a0ffc94b5ddb71bb2c1aa40a620395d2",
"assets/AssetManifest.json": "66b14069d24b405999ec726f071c77c1",
"assets/NOTICES": "de87b8ee933038dc8abd85707f9921bd",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d2efeff612058c576828432481c5acc2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "ee2a58501e3095feef03bdb6424d8eba",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a061c442a79355c42934cdfb913a4edf",
"assets/fonts/MaterialIcons-Regular.otf": "d10d6393db5cf9b35e6b91aa99522b61",
"assets/assets/images/projects/movies_challenge.png": "d90790b3519079f9fa606c7c84c000c8",
"assets/assets/images/projects/nutriutils.png": "ede9c3b43d50e0ad8e848e4551b452c6",
"assets/assets/images/projects/my_finances.png": "260bc3fbc60a85d720e0c32ac6a0960c",
"assets/assets/images/projects/flutter_book.png": "69fa8c2846ed913bdc7b69cbcc314446",
"assets/assets/images/projects/pokedex.png": "dba4e8e2887cde18f3b6c91f2a36514e",
"assets/assets/images/projects/notes_app.png": "027c05c68127e17c1457d08fc166f4f8",
"assets/assets/images/projects/investhelper.png": "c98cfef0f436b6baef92297a76b45b38",
"assets/assets/images/projects/pub_dev.png": "2345c74a95ca6fb5079692785c578345",
"assets/assets/images/projects/audiotexter.png": "f890093c420f5472a13cd69e798bd5b4",
"assets/assets/images/projects/gitf.png": "0fa97464aaeb5dcaffbd76b5c960ddd8",
"assets/assets/images/profile.jpeg": "3a96aa865479741632176e285801596d",
"assets/assets/icons/flutter.png": "e417bcfb1a718192ff6e2aa86799460a",
"assets/assets/icons/github.png": "1326a4686a3c3ace2a1b5d4314fcc7cd",
"assets/assets/icons/java.png": "1e1ba20cfa4a4c86d66437632e35df2f",
"assets/assets/icons/languages/en.png": "0a19622ee0439ba08fcdaeb242c3c042",
"assets/assets/icons/languages/es.png": "c0a6201343917c5c396bfe7f6a697cc8",
"assets/assets/icons/languages/pt.png": "89d8da52ba015b86240da14ac1ab2215",
"assets/assets/icons/csharp.png": "5a53e71a6eec78daeeea5077faba3a23",
"assets/assets/icons/swift.png": "abee73abd85cacd9a3e3e88b5e3d0d4d",
"assets/assets/icons/linkedin.png": "4666157dc519f30def4429670a36b8ba",
"assets/assets/icons/whatsapp.png": "6bd7aad7d4b0dc00d4adfdf6f0cbf399",
"assets/assets/icons/kotlin.png": "b291027cf7120cf4c390445d091b594b",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
