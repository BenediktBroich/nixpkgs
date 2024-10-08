# Generated by update.sh
{ fetchurl }:
{
  "curl-8.1.1.tar.xz" = fetchurl {
    url = "https://curl.se/download/curl-8.1.1.tar.xz";
    hash = "sha256-CKlI4GGSlkVZfB73GU4HswiyIIT/A/p0ALRl5sBRSeU=";
  };

  "brotli-1.0.9.tar.gz" = fetchurl {
    url = "https://github.com/google/brotli/archive/refs/tags/v1.0.9.tar.gz";
    hash = "sha256-+ejYHQQFumbRgVKa9CozVPg4yTkJX/mZMNpqqc32/kY=";
  };

  "nss-3.92.tar.gz" = fetchurl {
    url = "https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_92_RTM/src/nss-3.92-with-nspr-4.35.tar.gz";
    hash = "sha256-IcF2v/+27IQLX5hcf48BRoL0ovtVsGkkc0Fy1cBIbcU=";
  };

  "boringssl.zip" = fetchurl {
    url = "https://github.com/google/boringssl/archive/1b7fdbd9101dedc3e0aa3fcf4ff74eacddb34ecc.zip";
    hash = "sha256-daVVQvpxkuEL/8/+QtLOJkdO+ECYZE3P4qJmDjV1GM0=";
  };

  "nghttp2-1.56.0.tar.bz2" = fetchurl {
    url = "https://github.com/nghttp2/nghttp2/releases/download/v1.56.0/nghttp2-1.56.0.tar.bz2";
    hash = "sha256-L13Nv1d6LfUTokZGRUhMw10uTQczZT1jGTrlHbQd70E=";
  };
}
