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

<div class="container mx-auto">
  <div class="bg-gray-50 py-12 rounded-2xl mb-8">
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>
</div>

<footer class="bg-gray-900 text-gray-300 py-12">
  <div class="container mx-auto">
    <!-- Main Footer Content -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-8">
      {block name='hook_footer'}
        {hook h='displayFooter'}
      {/block}
    </div>
    
    <!-- Footer Bottom -->
    <div class="border-t border-gray-800 pt-8">
      <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
        <!-- Copyright -->
        <div class="text-gray-400 text-sm text-center md:text-left">
          {block name='copyright_link'}
            <a href="https://www.prestashop-project.org/" target="_blank" rel="noopener noreferrer nofollow" class="hover:text-white transition-colors duration-200">
              {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
            </a>
          {/block}
        </div>
        
        <!-- Footer After Hook -->
        <div class="flex space-x-4">
          {block name='hook_footer_after'}
            {hook h='displayFooterAfter'}
          {/block}
        </div>
      </div>
    </div>
  </div>
</footer>
