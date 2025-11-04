'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e51dcb63f184d08283278793926bb3dc",
"version.json": "69228c551cef9eb9ba10acb16fa19db1",
"index.html": "1ce21b67fd445a5b012457d33f07b999",
"/": "1ce21b67fd445a5b012457d33f07b999",
"main.dart.js": "b15555a41016bcb64d5ef85ed04ddbef",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"favicon.png": "abd6dcf86972e7a609043403462c5d77",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3396d9832f1617cf42e7382c464c0b9c",
"assets/AssetManifest.json": "5d480cfbfe6be76ebbc884db9466fba7",
"assets/NOTICES": "ebfbb6288965fa62c32fb2a1416f471c",
"assets/FontManifest.json": "44ef5745fa0b74d3921ed0508f0d4b40",
"assets/AssetManifest.bin.json": "fc5f29307b47365667d7d60e9a33e28b",
"assets/packages/flutter_gcaptcha_v3/assets/index.html": "950caadc27f7d52b11aca8727827f92b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_dropzone_web/assets/flutter_dropzone.js": "dddc5c70148f56609c3fb6b29929388e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c148030c86c84bd134c14dd5134607b8",
"assets/fonts/MaterialIcons-Regular.otf": "62bbf8e6114a5a5ef61e50bf217bbfdc",
"assets/assets/images/vnp_logo.png": "79ab1fad376cc62ecd1fe2d2b86afd51",
"assets/assets/images/image_area_warehouse.png": "1ae424192166dd92c607a6bcb3a798ce",
"assets/assets/images/bg_web.png": "1633632fbd5530ca62c2894497c70ac0",
"assets/assets/images/Vietcombank_logo.png": "1b5c87cef3effe0e053afa3c6f6f4567",
"assets/assets/images/bgBasic.png": "f90cfb57f47fc9749f2568c7211e8462",
"assets/assets/images/chPlayStore.png": "f36ff74ea1330461f2d3fa96f5aecf8a",
"assets/assets/images/banner_post_qr_mobile.png": "66d705ec14573b5fe410198752d28e64",
"assets/assets/images/bgLimited.png": "860268c7d7b5df74094874460ffa3e0e",
"assets/assets/images/bg_pattern_decorative.png": "e2b56518ca5983ec102cb536969e15de",
"assets/assets/images/img_logo_chotbatdongsan.png": "355464e023707a8260d281f86d7f5849",
"assets/assets/images/MB_logo.png": "f5c4e2e08b7b131b5699f88c6601dedb",
"assets/assets/images/bgPremium.png": "1d49f2239ce8e45c8c8c0bab440e04c6",
"assets/assets/images/bgDeluxe.png": "deff00145b41e321cd4a69639d5efb8d",
"assets/assets/images/appStore.png": "c8e132abf0859207973d1c582891bb5d",
"assets/assets/images/logo_web.png": "80003100c8bcd8328c1bcd3100430728",
"assets/assets/images/bidv_logo.png": "34ab8b523c00a21676c5799778e0578a",
"assets/assets/images/image_lo.png": "bb97365f808099c1a4e0bb1aece4299a",
"assets/assets/images/VPBank_logo.png": "406d8325ecb5790687328ec954e2910d",
"assets/assets/images/banner_apply_mobile.png": "f8da904411f54f0c537fcb6c9e79897d",
"assets/assets/images/bgluxury.png": "f7481bf24df23d197d2f9a37e06e4dcb",
"assets/assets/images/grey_bg_mobile_banner.png": "b21533980a2f0a331e03f7ae56913b50",
"assets/assets/images/banner_post_qr.png": "240c35e8bd13a3ebbd61214a548f0464",
"assets/assets/images/techcombank_logo.png": "e62e9d294ff38569a1a2cb8ef766e044",
"assets/assets/images/image_360_example.jpg": "44e51289421ac5b45dbf11882249b5e8",
"assets/assets/images/recapcha.png": "d63bb34fe0c2616e89801f7482696382",
"assets/assets/icons/ic_filter.svg": "b64935332a01c0916475230e35c11e68",
"assets/assets/icons/ic_cardmoney.svg": "69314a22022d4098eae9f182b342e842",
"assets/assets/icons/phone_incoming.svg": "7317dd76d4fb609058735993095bb9cd",
"assets/assets/icons/ic_limited.svg": "394148db90007b6dac63d200ec51215a",
"assets/assets/icons/null_Illustration.svg": "7ab824581d345c33b3d06e35774440c0",
"assets/assets/icons/ic_bell.svg": "16f3dcb0aa28afcb9fc3651bcef56e01",
"assets/assets/icons/ic_bed.svg": "dda3627b9eba4f2638bf987b8b2c1f23",
"assets/assets/icons/ic_premium.svg": "1f7d5164bfff6f318b9f4a1a1ec740a2",
"assets/assets/icons/ic_luxury.svg": "6ab8b285cf1bd607f857c511269f6366",
"assets/assets/icons/ic_basic.svg": "e5c66c197c641c09873253066ff2f5f3",
"assets/assets/icons/ic_wrapper.svg": "4cee1a7ca8eaf08501b523bdb62b5df9",
"assets/assets/icons/ic_wrapper_fly.svg": "ff47649d5f0b28d898e3f2d26ed7d167",
"assets/assets/icons/ic_bread_crumb.svg": "fc548a96a8803d8510b692d2b5043b2e",
"assets/assets/icons/envelope_simple.svg": "556eaa2b0f1a7a52c028d13cf3f3e9dd",
"assets/assets/icons/ic_write.svg": "3a515288175d8d34285e9b44a2a4aba6",
"assets/assets/icons/ic_deluxe.svg": "47cbb6cbd17c0b7d31364e8b3c3f7e50",
"assets/assets/icons/ic_search_lg.svg": "eb47073b9107e8f617cf958cab95307a",
"assets/assets/icons/upload_cloud.svg": "5df82d489f1e7e93318d0aaab40a092f",
"assets/assets/icons/ic_check.svg": "ec4c811c1ff05cfd13f7c0e5df325b4a",
"assets/assets/icons/ic_menu.svg": "9e028d0bf23e71fe8d5ed0a0a0ce5622",
"assets/assets/icons/ic_Logo_color.svg": "09cdf73cae57d9c857a3b5ffac1af5c4",
"assets/assets/icons/ic_area_m2.svg": "6d5814c1b06ba23bcb4e38d0b6bf1827",
"assets/assets/icons/ic_bar_chart.svg": "c10a9047abad282306890022d14bb66a",
"assets/assets/icons/ic_chevron_right.svg": "71ceeeb74e4b58a520ae25cfd2cc36a4",
"assets/assets/icons/icking.svg": "190bd6bc0fcfb195f894d145714c6de6",
"assets/assets/icons/monitor.svg": "ccfe4c38a41362a6300a2a1dced57982",
"assets/assets/fonts/Inter-VariableFont_opsz,wght.ttf": "0a77e23a8fdbe6caefd53cb04c26fabc",
"assets/assets/fonts/Inter-Italic-VariableFont_opsz,wght.ttf": "6dce17792107f0321537c2f1e9f12866",
"assets/assets/gif/loading_g18.gif": "fa5fded425f2f5a85cb228a579857f39",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
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
