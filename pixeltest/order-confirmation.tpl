{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}



{capture name=path}{l s='Order confirmation'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}


<script type="text/javascript">

  {assign var='id_cart' value={$request_uri|regex_replace:"/.*id_cart=([\d]*).*/":"$1"}}
  {$totalCart = $cart->getTotalCart($id_cart)|regex_replace:"/[\D]+.*/":""}
  {literal}

  /* <![CDATA[ */

  _gaq.push(['_addTrans',
    {$id_order},           // transaction ID - required
    'Pixel 80',  // affiliation or store name
    {/literal}{$totalCart}{literal},          // total - required
  ]);

  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers


  // Google Code for buy Conversion Page

	var google_conversion_id = 1020557169;
	var google_conversion_language = "en";
	var google_conversion_format = "3";
	var google_conversion_color = "ffffff";
	var google_conversion_label = "pQZXCLe-zAgQ8e7R5gM";
  var google_remarketing_only = false;
	var google_conversion_value = {/literal}{$totalCart}{literal};{/literal}
	/* ]]> */
</script>

<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
	<div style="display:inline;">
		<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/1020557169/?value={$totalCart}&amp;label=pQZXCLe-zAgQ8e7R5gM&amp;guid=ON&amp;script=0" />
	</div>
</noscript>



<h1>{l s='Order confirmation'}</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{include file="$tpl_dir./errors.tpl"}

{$HOOK_ORDER_CONFIRMATION}
{$HOOK_PAYMENT_RETURN}

<br />
{if $is_guest}
	<p>{l s='Your order ID is:'} <span class="bold">{$id_order_formatted}</span> . {l s='Your order ID has been sent via email.'}</p>
	<a href="{$link->getPageLink('guest-tracking', true, NULL, "id_order={$reference_order}&email={$email}")|escape:'html'}" title="{l s='Follow my order'}"><img src="{$img_dir}icon/order.gif" alt="{l s='Follow my order'}" class="icon" /></a>
	<a href="{$link->getPageLink('guest-tracking', true, NULL, "id_order={$reference_order}&email={$email}")|escape:'html'}" title="{l s='Follow my order'}">{l s='Follow my order'}</a>
{else}
	<a href="{$link->getPageLink('history', true)|escape:'html'}" title="{l s='Back to orders'}"><img src="{$img_dir}icon/order.gif" alt="{l s='Back to orders'}" class="icon" /></a>
	<a href="{$link->getPageLink('history', true)|escape:'html'}" title="{l s='Back to orders'}">{l s='Back to orders'}</a>
{/if}
