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

{block name='header_banner'}
  <div class="bg-gray-50 py-2 text-sm">
    <div class="container mx-auto text-center text-gray-600">
      {hook h='displayBanner'}
    </div>
  </div>
{/block}

{block name='header_nav'}
  <nav class="bg-white border-b border-gray-100">
    <div class="container mx-auto py-2">
      <div class="flex justify-between items-center">
        <div class="hidden md:flex">
          {hook h='displayNav1'}
        </div>
        <div class="hidden md:flex items-center space-x-6">
          {hook h='displayNav2'}
        </div>
        
        <!-- Mobile menu -->
        <div class="md:hidden flex items-center justify-between w-full">
          <div class="p-2 text-gray-600" id="menu-icon">
            <i class="material-icons text-2xl">&#xE5D2;</i>
          </div>
          <div class="flex items-center space-x-2">
            <div id="_mobile_user_info"></div>
            <div id="_mobile_cart"></div>
          </div>
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="bg-white py-4 border-b border-gray-100">
    <div class="container mx-auto">
      <div class="flex items-center justify-between">
        <!-- Logo -->
        <div class="flex items-center" id="_desktop_logo">
          {if $shop.logo_details}
            {if $page.page_name == 'index'}
              <h1 class="m-0">
                {renderLogo}
              </h1>
            {else}
              {renderLogo}
            {/if}
          {/if}
        </div>
        
        <!-- Search and Navigation -->
        <div class="flex-1 flex items-center justify-end space-x-6 ml-8">
          {hook h='displayTop'}
        </div>
      </div>
      
      <!-- Mobile Top Menu -->
      <div id="mobile_top_menu_wrapper" class="md:hidden mt-4" style="display:none;">
        <div class="py-2" id="_mobile_top_menu"></div>
        <div class="border-t border-gray-100 pt-4 space-y-2">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
      
      <!-- Mobile Logo -->
      <div class="md:hidden text-center py-4" id="_mobile_logo">
        {if $shop.logo_details}
          {renderLogo}
        {/if}
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}
