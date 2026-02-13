'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "4ca826acd1da33bc87c18a3d914b99ec",
"version.json": "8e940c198fa0e920c8dc64de4038025d",
"index.html": "5bcab0416479b698e514b8ad76c64eef",
"/": "5bcab0416479b698e514b8ad76c64eef",
"main.dart.js": "d6078ee6c7c21cf5d5e76c09babe4d34",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "0660437b89b8123a4d465c4c5ae08245",
"assets/AssetManifest.json": "5f546cdca38cba6615ab3836ce9857c7",
"assets/NOTICES": "71e15bb74f7ce34efc33a6daa4a6e684",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "cb723ff71924601374f9281dc217f91a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2f1742e249fa8845f088cfd33c9f1194",
"assets/fonts/MaterialIcons-Regular.otf": "dd320e29fbae1379cffd21332582bc0d",
"assets/assets/images/img_1.jpg": "38b377921fb3d290edb35e4265f1a601",
"assets/assets/images/image_g3.png": "07baafb693101ba450184e8b4e93851e",
"assets/assets/images/hid_img6.png": "ec94fa21bf6d5e4b0c3b73e5f56f9dec",
"assets/assets/images/hid_img7.png": "bbdcfcf2e23e387dda0de676f6c71b2d",
"assets/assets/images/hid_img5.png": "77c6c84175eb600ecbccd7bfecd0800a",
"assets/assets/images/time_gif_animation.gif": "6b13716876be3f35b528bb221456d38d",
"assets/assets/images/hid_img4.png": "154b2d7b16844cf5adf25022dfc01a81",
"assets/assets/images/img_menu_page_0.jpg": "b46b8466160a7de29920cc106e02d8e5",
"assets/assets/images/hid_img1.png": "4c9a15d5ecff8eab2a6171992726b62a",
"assets/assets/images/gif_g2.mp4": "e2f7d28485986d8cdb17f5f3d1fbd424",
"assets/assets/images/hid_img3.png": "ffd3d32718f9273eccb809dfa8c030e3",
"assets/assets/images/img2_g2.png": "120ebeb99d60dd6c63aadf48eb9cb32d",
"assets/assets/images/start_mp4.mp4": "294140dd8a15e18c62ece554bd88ee89",
"assets/assets/images/hid_img2.png": "83278229954a08ee9f5f6caff86cc5f6",
"assets/assets/images/black_paint.png": "7d63a99f4edf2841c1f2bb3cbcb6a1c1",
"assets/assets/images/logo.png": "ee6164def268311a6de25e0460d9ffd0",
"assets/assets/images/bgim.png": "dc7ca779f04803ea3503d5674351da9d",
"assets/assets/images/img2.png": "f1e610c76eb220ec8f531b280341cb07",
"assets/assets/images/hid_img8.png": "63cd96896db44dcf53212584feb11081",
"assets/assets/images/img1.png": "2d2431878273d8e8b4db01d00d5dc6e1",
"assets/assets/images/rule_mp4.mp4": "c60df81c090c0de39eb159502ad14e90",
"assets/assets/images/star.png": "fd9ae9cd982ec36278bf521ba7a8909f",
"assets/assets/images/icon_chilli.png": "92cf18014fb5e9ecf1abd14bd33bfd30",
"assets/assets/images/bgr_g2.png": "c723899dedf160b33471866f6a307354",
"assets/assets/sounds/vietnamcobacho.mp3": "5b8288eed96da5e10ee4068b20ee02e4",
"assets/assets/sounds/wrong.mp3": "b7eb454f3d19a083d72c34f1b4cb453b",
"assets/assets/sounds/correct.mp3": "669ea9c20aa437230fa23bfa56bf82e8",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
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
