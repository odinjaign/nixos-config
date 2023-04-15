{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-han-sans
      source-han-serif
      sarasa-gothic #更纱黑体
      source-code-pro
      hack-font
      jetbrains-mono
      wqy_microhei
      wqy_zenhei
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "JetBrainsMono"
          "FantasqueSansMono"
        ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
