#!/bin/bash

# --- CONFIGURAZIONE ---
CHIAVE_SEGRETA="$HOME/Desktop/chiavi_openwrt/chiave_ilblogdicristiangallo.sec"
CHIAVE_PUBBLICA="$HOME/Desktop/chiavi_openwrt/chiave_ilblogdicristiangallo.pub"
# ----------------------

echo ">>> 1. PULIZIA: Rimuovo vecchi indici..."
rm -f Packages Packages.gz Packages.sig Packages.manifest Packages.stamps

echo ">>> 2. COPIA CHIAVE: Metto la chiave pubblica nel repo (come sorgente)..."
cp "$CHIAVE_PUBBLICA" .

echo ">>> 3. INDEXING: Creo la lista dei pacchetti IPK..."
opkg-make-index . > Packages

echo ">>> 4. COMPRESSIONE: Creo Packages.gz..."
gzip -k Packages

echo ">>> 5. FIRMA: Creo Packages.sig (Stile Ufficiale)..."
if usign -S -m Packages -s "$CHIAVE_SEGRETA" -x Packages.sig; then
    echo "    [OK] Firma generata correttamente."
else
    echo "    [ERRORE] Firma fallita. Controlla la chiave segreta!"
    exit 1
fi

echo ">>> 6. UPLOAD: Spedisco tutto su GitHub..."
git add .
git commit -m "Update Repo - Struttura Ufficiale"
git push origin main

echo "------------------------------------------------"
echo "FATTO! Il tuo repo è ora identico a quello di 4IceG."
echo "Link chiave: https://ilblogdicristiangallo.github.io/ilblogdicristiangallo_repo_openwrt/chiave_ilblogdicristiangallo.pub"
echo "------------------------------------------------"
