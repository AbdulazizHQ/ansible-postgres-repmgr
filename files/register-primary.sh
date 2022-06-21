#! /bin/bash
ALREADY_REGISTERED_ERROR="ERROR: this node is already registered"
# Run command and store output in a tmp file
/usr/pgsql-14/bin/repmgr primary register > /tmp/register-primary.out 2>&1
REPMGR_EXIT_CODE=$?
REPMGR_OUT=$(cat /tmp/register-primary.out)

rm -rf /tmp/register-primary.out

if [ $REPMGR_EXIT_CODE -ne 0 ]
then
  echo "$REPMGR_OUT" | grep "$ALREADY_REGISTERED_ERROR" > /dev/null
  exit "$?"
fi
exit 0