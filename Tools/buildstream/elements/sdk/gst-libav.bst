kind: meson
sources:
- kind: tar
  url: gst_downloads:gst-libav/gst-libav-1.18.5.tar.xz
  ref: 822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- freedesktop-sdk.bst:components/nasm.bst
depends:
- sdk/ffmpeg.bst
- sdk/gst-plugins-base.bst
- freedesktop-sdk.bst:components/orc.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  meson-local: >-
    -Dc_args=-DTRIPLET=\"%{gcc_triplet}\"
    -Ddoc=disabled
public:
  bst:
    overlap-whitelist:
    - '**'

    integration-commands:
    - |
      PAGER=this-is-not-a-pager gst-inspect-1.0 libav
