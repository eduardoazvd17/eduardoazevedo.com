'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f27bbfd6718d269437f05d49250dc126",
"assets/AssetManifest.bin.json": "f529078d8987ce5275597585b4879c64",
"assets/AssetManifest.json": "aafb96be6b169e29b58e315a3b785961",
"assets/assets/icons/csharp.png": "5a53e71a6eec78daeeea5077faba3a23",
"assets/assets/icons/flutter.png": "e417bcfb1a718192ff6e2aa86799460a",
"assets/assets/icons/github.png": "1326a4686a3c3ace2a1b5d4314fcc7cd",
"assets/assets/icons/java.png": "1e1ba20cfa4a4c86d66437632e35df2f",
"assets/assets/icons/javascript.png": "7ea86385d79f3c9326eee12f0398cc26",
"assets/assets/icons/languages/en.png": "0a19622ee0439ba08fcdaeb242c3c042",
"assets/assets/icons/languages/es.png": "c0a6201343917c5c396bfe7f6a697cc8",
"assets/assets/icons/languages/pt.png": "89d8da52ba015b86240da14ac1ab2215",
"assets/assets/icons/linkedin.png": "4666157dc519f30def4429670a36b8ba",
"assets/assets/icons/python.png": "69bde9d207e914df93505d8bd8148f9b",
"assets/assets/icons/whatsapp.png": "6bd7aad7d4b0dc00d4adfdf6f0cbf399",
"assets/assets/images/profile.jpeg": "3a96aa865479741632176e285801596d",
"assets/assets/images/projects/flutter_book.png": "69fa8c2846ed913bdc7b69cbcc314446",
"assets/assets/images/projects/gitf.png": "0fa97464aaeb5dcaffbd76b5c960ddd8",
"assets/assets/images/projects/movies_challenge.png": "d90790b3519079f9fa606c7c84c000c8",
"assets/assets/images/projects/my_finances.png": "260bc3fbc60a85d720e0c32ac6a0960c",
"assets/assets/images/projects/notes_app.png": "027c05c68127e17c1457d08fc166f4f8",
"assets/assets/images/projects/pokedex.png": "dba4e8e2887cde18f3b6c91f2a36514e",
"assets/assets/images/projects/pub_dev.png": "2345c74a95ca6fb5079692785c578345",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "98360c5d7e1bfdc1556d3d993f14365d",
"assets/NOTICES": "815f52526356d0f4b788c870c33a16bf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f9a6ed33761ba13e5e2cd8c7f5fb654a",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-512.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-maskable-192.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"icons/Icon-maskable-512.png": "7e6663123a9ea804e75a340ff4c0f1c1",
"index.html": "61d1d0874210eb4f5f85de34dccc811f",
"/": "61d1d0874210eb4f5f85de34dccc811f",
"main.dart.js": "670f5626e62775c4a07ab592b29cb805",
"manifest.json": "50186102a59b34a320197e48bfdd93e5",
"version.json": "8b4d1591aa55f3fe3c5ca7fb6ff9bb53"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
