{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name='product_miniature_item'}
<div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
  <article class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-300 group product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
    
    {* Product Image *}
    <div class="relative overflow-hidden aspect-square">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.url}" class="block">
            <picture>
              {if !empty($product.cover.bySize.home_default.sources.avif)}<source srcset="{$product.cover.bySize.home_default.sources.avif}" type="image/avif">{/if}
              {if !empty($product.cover.bySize.home_default.sources.webp)}<source srcset="{$product.cover.bySize.home_default.sources.webp}" type="image/webp">{/if}
              <img
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                src="{$product.cover.bySize.home_default.url}"
                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                loading="lazy"
                data-full-size-image-url="{$product.cover.large.url}"
                width="{$product.cover.bySize.home_default.width}"
                height="{$product.cover.bySize.home_default.height}"
              />
            </picture>
          </a>
        {else}
          <a href="{$product.url}" class="block">
            <picture>
              {if !empty($urls.no_picture_image.bySize.home_default.sources.avif)}<source srcset="{$urls.no_picture_image.bySize.home_default.sources.avif}" type="image/avif">{/if}
              {if !empty($urls.no_picture_image.bySize.home_default.sources.webp)}<source srcset="{$urls.no_picture_image.bySize.home_default.sources.webp}" type="image/webp">{/if}
              <img
                class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                src="{$urls.no_picture_image.bySize.home_default.url}"
                alt="{$product.name|truncate:30:'...'}"
                loading="lazy"
                width="{$urls.no_picture_image.bySize.home_default.width}"
                height="{$urls.no_picture_image.bySize.home_default.height}"
              />
            </picture>
          </a>
        {/if}
      {/block}

      {* Product Flags *}
      {block name='product_flags'}
        <div class="absolute top-3 left-3 space-y-1">
          {foreach from=$product.flags item=flag}
            <span class="inline-block px-2 py-1 text-xs font-medium rounded-full {if $flag.type == 'new'}bg-blue-100 text-blue-800{elseif $flag.type == 'discount'}bg-red-100 text-red-800{elseif $flag.type == 'online-only'}bg-green-100 text-green-800{else}bg-gray-100 text-gray-800{/if}">
              {$flag.label}
            </span>
          {/foreach}
        </div>
      {/block}
    </div>
                <img
                  class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  src="{$urls.no_picture_image.bySize.home_default.url}"
                  alt="{$product.name|truncate:30:'...'}"
                  loading="lazy"
                  width="{$urls.no_picture_image.bySize.home_default.width}"
                  height="{$urls.no_picture_image.bySize.home_default.height}"
                />
              </picture>
            </a>
          {/if}
      {/block}
    </div>

    {* Product Content *}
    <div class="p-4">
      {* Product Name *}
      {block name='product_name'}
        {if $page.page_name == 'index'}
          <h3 class="text-gray-900 font-medium mb-2 line-clamp-2 leading-tight">
            <a href="{$product.url}" class="hover:text-blue-600 transition-colors duration-200" content="{$product.url}">
              {$product.name|truncate:50:'...'}
            </a>
          </h3>
        {else}
          <h2 class="text-gray-900 font-medium mb-2 line-clamp-2 leading-tight">
            <a href="{$product.url}" class="hover:text-blue-600 transition-colors duration-200" content="{$product.url}">
              {$product.name|truncate:50:'...'}
            </a>
          </h2>
        {/if}
      {/block}

      {* Product Price *}
      {block name='product_price_and_shipping'}
        {if $product.show_price}
          <div class="text-lg font-semibold text-gray-900 mb-3">
            {if $product.has_discount}
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              <span class="text-red-600 mr-2">{$product.price}</span>
              <span class="text-gray-400 line-through text-base font-normal">{$product.regular_price}</span>
              {if $product.discount_type === 'percentage'}
                <span class="ml-2 inline-block px-2 py-1 text-xs font-medium bg-red-100 text-red-800 rounded-full">
                  {$product.discount_percentage}
                </span>
              {elseif $product.discount_type === 'amount'}
                <span class="ml-2 inline-block px-2 py-1 text-xs font-medium bg-red-100 text-red-800 rounded-full">
                  {$product.discount_amount_to_display}
                </span>
              {/if}
            {else}
              {hook h='displayProductPriceBlock' product=$product type="before_price"}
              <span>
                {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                {if '' !== $smarty.capture.custom_price}
                  {$smarty.capture.custom_price nofilter}
                {else}
                  {$product.price}
                {/if}
              </span>
            {/if}
            {hook h='displayProductPriceBlock' product=$product type='unit_price'}
            {hook h='displayProductPriceBlock' product=$product type='weight'}
          </div>
        {/if}
      {/block}

      {* Product Reviews *}
      {block name='product_reviews'}
        {hook h='displayProductListReviews' product=$product}
      {/block}

      {* Add to Cart Button *}
      <div class="mt-4">
        <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh">
          <input type="hidden" name="token" value="{$static_token}">
          <input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
          <input type="hidden" name="id_customization" value="{$product.id_customization}" class="product_customization_id">
          
          <button 
            class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-lg transition-colors duration-200 btn-primary add-to-cart" 
            data-button-action="add-to-cart" 
            type="submit"
            {if (!$product.add_to_cart_url && $product.availability !== 'available') || $configuration.is_catalog}disabled{/if}
          >
            <i class="material-icons shopping-cart mr-1">&#xE8CC;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
          </button>
          {hook h='displayProductActions' product=$product}
        </form>
      </div>
    </div>

    {* Quick View (hidden but available for interaction) *}
    <div class="absolute top-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity duration-200">
      {block name='quick_view'}
        <a class="bg-white p-2 rounded-full shadow-md hover:shadow-lg transition-shadow duration-200 quick-view js-quick-view" href="#" data-link-action="quickview">
          <i class="material-icons text-gray-600 text-lg">&#xE8B6;</i>
        </a>
      {/block}
    </div>

    {* Product Variants *}
    {block name='product_variants'}
      {if $product.main_variants}
        <div class="px-4 pb-4">
          {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
        </div>
      {/if}
    {/block}
  </article>
</div>
{/block}
