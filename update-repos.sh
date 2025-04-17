

#!/bin/bash
# Script para actualizar tus remotos al nuevo usuario Piczadev
cd ~/Code  # cambia si usas otra carpeta base

for d in */ ; do
  cd "$d"
  if [ -d .git ]; then
    repo=$(basename `git rev-parse --show-toplevel`)
    git remote set-url origin git@github.com:Piczadev/$repo.git
    echo "✅ Actualizado: $repo"
  fi
  cd ..
done
