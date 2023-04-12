# Nix Home-Manager

profiles=(
  $HOME/.nix-profile/etc/profile.d/nix.sh
  $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
)

for profile in ${profiles[@]};
do
  if [ -f $profile ]; then
    . $profile
  fi
done
