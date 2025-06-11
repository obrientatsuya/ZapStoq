# Define base path
$basePath = "ZapStoq"

# Lista de arquivos e pastas a serem criados
$estrutura = @(
    # Bots - Inventory
    "bots/inventory/handlers/addProduct.ts",
    "bots/inventory/handlers/updateInventory.ts",
    "bots/inventory/handlers/removeProduct.ts",
    "bots/inventory/parser/inventoryParser.ts",
    "bots/inventory/services/productService.ts",
    "bots/inventory/services/inventoryService.ts",
    "bots/inventory/index.ts",

    # Bots - Sales
    "bots/sales/handlers/startSale.ts",
    "bots/sales/handlers/addToCart.ts",
    "bots/sales/handlers/checkout.ts",
    "bots/sales/parser/salesParser.ts",
    "bots/sales/services/paymentService.ts",
    "bots/sales/services/orderService.ts",
    "bots/sales/index.ts",

    # Bots - Reports
    "bots/reports/handlers/todaySales.ts",
    "bots/reports/handlers/topProducts.ts",
    "bots/reports/parser/reportParser.ts",
    "bots/reports/services/reportService.ts",
    "bots/reports/index.ts",

    # Core
    "core/config/config.ts",
    "core/db/schema.ts",
    "core/db/client.ts",
    "core/utils/logger.ts",
    "core/utils/file.ts",
    "core/types/product.ts",
    "core/types/order.ts",

    # Public
    "public/db.sqlite",

    # Venom
    "venom/session.ts",
    "venom/client.ts"

)

# Criação dos arquivos e pastas
foreach ($item in $estrutura) {
    $fullPath = Join-Path $basePath $item
    $folder = Split-Path $fullPath -Parent

    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }

    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType File -Path $fullPath -Force | Out-Null
    }
}

Write-Host "✅ Estrutura de projeto 'ZapStoq' criada com sucesso!"
