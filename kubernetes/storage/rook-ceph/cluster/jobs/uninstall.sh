# bin/sh

# Script delete all resources from
# ../filesystems/*.yamls
# ../objectstores/*.yamls
# ../blockpools/*.yamls
# files in kubernetes cluster at namespace rook-ceph
# k delete -n rook-ceph

# ensure we start from dir where this script is located
# and then return we return to there script was executed

# 0. Get the directory of the script
SCRIPT_DIR=$(dirname "$0")

# 1. Get all filesystems yamls
# use SCRIPT_DIR to get the filesystems yamls
FILESYSTEMS=$(ls $SCRIPT_DIR/../filesystems/*.yaml)
# 2. Loop through each filesystem yaml
for fs in $FILESYSTEMS; do
  # 3. Get the filesystem name from the yaml file
  FS_NAME=$(basename $fs .yaml)
  # 4. Delete the filesystem
  echo "Deleting filesystem $FS_NAME"
  kubectl delete -f $fs -n rook-ceph
done


# 5. Get all objectstores yamls
OBJECTSTORES=$(ls $SCRIPT_DIR/../objectstores/*.yaml)
# 6. Loop through each objectstore yaml
for os in $OBJECTSTORES; do
  # 7. Get the objectstore name from the yaml file
  OS_NAME=$(basename $os .yaml)
  # 8. Delete the objectstore
  echo "Deleting objectstore $OS_NAME"
  kubectl delete -f $os -n rook-ceph
done
# 9. Get all blockpools yamls
BLOCKPOOLS=$(ls $SCRIPT_DIR/../blockpools/*.yaml)
# 10. Loop through each blockpool yaml
for bp in $BLOCKPOOLS; do
  # 11. Get the blockpool name from the yaml file
  BP_NAME=$(basename $bp .yaml)
  # 12. Delete the blockpool
  echo "Deleting blockpool $BP_NAME"
  kubectl delete -f $bp -n rook-ceph
done

