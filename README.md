# XXL - Construction XLINE Layer Switch

An AutoLISP wrapper around the native `XLINE` command. It switches to `XL-LINES` with ACI color 8, starts the native command, then restores the previous current layer and color on completion or cancellation.

## Use

Load `xxl.lsp` with `APPLOAD`, or add it to the Startup Suite. Run `XXL` and use the native XLINE options (`H`, `V`, `A`, `B`, or `O`) as usual.

The command creates `XL-LINES` if it does not exist. Current layer and color are restored after the command ends.

## Compatibility and status

Designed for AutoCAD AutoLISP. Verify native option passthrough and Esc-cancel restoration in a test drawing before production use.

## License

MIT. See [LICENSE](./LICENSE).
