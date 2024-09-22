'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "ba7c18b53f133a2743e0ee3af7620665",
"version.json": "6d5b19dcf0c680c96462284fe4a47050",
"index.html": "630a3420d3cda400645719fdfc02243e",
"/": "630a3420d3cda400645719fdfc02243e",
"main.dart.js": "53ee4d094e7cb46b6dea96895910781b",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5bb85223c0922289873ab56dabe518ab",
"assets/AssetManifest.json": "bc9e3430c429e50c04fe5f7b44b87107",
"assets/NOTICES": "014a4a25fef00232236fc1df6c9f2cae",
"assets/FontManifest.json": "c88836cad15a0ea9f7535c66e97c5115",
"assets/AssetManifest.bin.json": "5819297149c9ff7cd6a0980074bff4ca",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d6535514b860425f4f973455bd117ebf",
"assets/fonts/MaterialIcons-Regular.otf": "d58c848a62c7a95e988960c10c4e513d",
"assets/assets/svg/home.svg": "2d8fefcdb88aea7b4c4ab74d38b7834f",
"assets/assets/svg/paiement.svg": "a387fff4d773b697c807c65ed1667f5b",
"assets/assets/svg/logout.svg": "0f7ad49edd35d4d478481d67e1e7ceb1",
"assets/assets/svg/order.svg": "4a76dcee40ea2eb6b74f81a7e230f515",
"assets/assets/svg/mail.svg": "8f27d7e48f85926b6b3f467d560c9758",
"assets/assets/svg/sales.svg": "76ec6787ae76e59e8393edcbd1852aa5",
"assets/assets/svg/caisse.svg": "968e091c64492e9ee57286305c9f425b",
"assets/assets/svg/dashboard.svg": "fc75eb087902503bb571922327d6477b",
"assets/assets/svg/document.svg": "888e091e9c095f4e9d7075ae75562c91",
"assets/assets/svg/jira.svg": "70365e83cd76257bcb81174ebc7c7c1a",
"assets/assets/svg/intercom.svg": "65c45b12f078d36a87bdeadaa70ff1cd",
"assets/assets/svg/setting.svg": "624c91cfd166f8f7b716222c51ea76a6",
"assets/assets/svg/chat.svg": "7ad3417b840e6dd620f9fc0be1f04c3d",
"assets/assets/svg/notification.svg": "e9d57936d5d8e9215760ac1a561b1e86",
"assets/assets/svg/home-icon.svg": "0bf48a1135b42d124279290eac599b60",
"assets/assets/svg/project_task.svg": "3c0815c44682e78081018d1f666bc751",
"assets/assets/svg/profile.svg": "b027718cea71d68918e62d7b22575009",
"assets/assets/svg/filter.svg": "7e4cf4b46a4dba74040cc418524292cb",
"assets/assets/svg/calendar.svg": "b68664065409195407b3f218b3016d14",
"assets/assets/svg/slack.svg": "22a7caa60c75919d6d4267bca63caaf4",
"assets/assets/svg/graph.svg": "52b4975f54a1d1d706ea82ebc67dd913",
"assets/assets/svg/swap.svg": "4cc4cdd9feaa5dbd2d45ec8fa0179da6",
"assets/assets/images/empty.png": "1b1341f48c437e5af3dcd6102c3ac73b",
"assets/assets/images/delivery-info.png": "0d3a5a4348aeb96f4b7f13e2278413fa",
"assets/assets/images/background.jpg": "9b549c811d418fc731d50881d2ae789d",
"assets/assets/images/order-delivery.png": "df1659cdf5f75e8f4afb47c22f93bd4d",
"assets/assets/images/empty-cart.png": "c856880f2f01ef8b583fa5480a1613a5",
"assets/assets/images/logo.png": "eaf650af658ec4e0afe249ee142ea881",
"assets/assets/images/internal-server-error.png": "5e39e038f2d81a38826ecc323aad4d8a",
"assets/assets/images/no-connection.png": "88714d67ea7045c69a0f1087f8bc3afa",
"assets/assets/fonts/Inter-Medium.ttf": "a473e623af12065b4b9cb8db4068fb9c",
"assets/assets/fonts/Inter-Bold.ttf": "8f2869a84ad71f156a17bb66611ebe22",
"assets/assets/fonts/Inter-Regular.ttf": "fdb50e0d48cdcf775fa1ac0dc3c33bd4",
"assets/assets/fonts/Inter-Italic.ttf": "118abbe34a2979b66d6838805c56b7cd",
"assets/assets/fonts/Inter-SemiBold.ttf": "4d24f378e7f8656a5bccb128265a6c3d",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
