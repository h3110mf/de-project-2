
------------DDL---------------------------------------------------------------------------
------------public.shipping_country_rates-------------------------------------------------
DROP TABLE IF EXISTS public.shipping_country_rates;

CREATE TABLE public.shipping_country_rates (
						id SERIAL PRIMARY KEY,
						shipping_country TEXT,
						shipping_country_base_rate NUMERIC(14,3)
					);
CREATE INDEX shipping_country_id ON public.shipping_country_rates (id);
COMMENT ON COLUMN public.shipping_country_rates.id is 'id for countries';
------------------------------------------------------------------------------------------
---хххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххх-
------------public.shipping_agreement ----------------------------------------------------
DROP TABLE IF EXISTS public.shipping_agreement;

CREATE TABLE public.shipping_agreement (
						agreementid  INT8 PRIMARY KEY,
						agreement_number TEXT,
						agreement_rate NUMERIC(14,2),
						agreement_commission NUMERIC(14,2)
					);

------ посмотреть данные в vendor_agreement_description-----------------------------------
------------------------------------------------------------------------------------------
---хххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххx-
------------public.shipping_transfer  ----------------------------------------------------
DROP TABLE IF EXISTS public.shipping_transfer;

CREATE TABLE public.shipping_transfer (
						id SERIAL PRIMARY KEY,
						transfer_type TEXT,
						transfer_model TEXT,
						shipping_transfer_rate NUMERIC(14,3)
					);
CREATE INDEX transfer_type_id ON public.shipping_transfer (id);
COMMENT ON COLUMN public.shipping_transfer.id is 'id for transfer types';

------ посмотреть данные в shipping_transfer_description -----------------------------------
--------------------------------------------------------------------------------------------
---хххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххх-
------------public.shipping_info -----  ----------------------------------------------------
DROP TABLE IF EXISTS public.shipping_info;

CREATE TABLE public.shipping_info (
						shippingid BIGINT PRIMARY KEY,
						vendorid BIGINT,
						payment_amount NUMERIC(14,2),
						shipping_plan_datetime TIMESTAMP,
						transfer_type_id INT8,
						shipping_country_id INT8,
						agreementid INT8,
----------------------		НАЗНАЧЕНИЕ ВНЕШНИХ КЛЮЧЕЙ-----------------------------------
foreign key (transfer_type_id) references public.shipping_transfer(id) on update cascade,
foreign key (shipping_country_id) references public.shipping_country_rates(id) on update cascade,
foreign key (agreementid) references public.shipping_agreement(agreementid) on update cascade
					);
----------------------		НАЗНАЧЕНИЕ ВНЕШНИХ КЛЮЧЕЙ-----------------------------------
--------------------------------------------------------------------------------------------
---хххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххх-
------------public.shipping_status   -------------------------------------------------------

DROP TABLE IF EXISTS public.shipping_status;

CREATE TABLE public.shipping_status (
						shippingid BIGINT PRIMARY KEY,
						status TEXT,
						state TEXT,
						shipping_start_fact_datetime TIMESTAMP,
						shipping_end_fact_datetime TIMESTAMP
					);

----------------------		НАЗНАЧЕНИЕ ВНЕШНИХ КЛЮЧЕЙ-----------------------------------


--------------------------------------------------------------------------------------------
---хххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххххх-
--------------------------------------------------------------------------------------------