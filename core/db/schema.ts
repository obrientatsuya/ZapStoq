// drizzle/schema.ts
import { sqliteTable, integer, text, real } from 'drizzle-orm/sqlite-core';

export const products = sqliteTable('products', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  name: text('name').notNull().unique(),
  sku: text('sku').notNull().unique(),
  price: real('price').notNull(),
  unit: text('unit').notNull(), // e.g., kg, unid, cx
  category: text('category').notNull(),
  description: text('description'),
});

export const inventory = sqliteTable('inventory', {
  productId: integer('product_id').notNull().references(() => products.id),
  quantity: integer('quantity').notNull(),
});

export const inventoryMovements = sqliteTable('inventory_movements', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  productId: integer('product_id').notNull().references(() => products.id),
  date: text('date').default("(datetime('now'))"),
  quantity: integer('quantity').notNull(), // positive = in, negative = out
  reason: text('reason').notNull(), // e.g., sale, restock, return, loss
});

export const orders = sqliteTable('orders', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  createdAt: text('created_at').default("(datetime('now'))"),
  total: real('total').notNull(),
});

export const orderItems = sqliteTable('order_items', {
  orderId: integer('order_id').notNull().references(() => orders.id),
  productId: integer('product_id').notNull().references(() => products.id),
  quantity: integer('quantity').notNull(),
  unitPrice: real('unit_price').notNull(),
});
