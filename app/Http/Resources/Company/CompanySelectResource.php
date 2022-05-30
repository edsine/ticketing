<?php

namespace App\Http\Resources\Company;

use App\Models\Company;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CompanySelectResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  Request  $request
     * @return array
     */
    public function toArray($request)
    {
        /** @var Company $company */
        $company = $this;
        return [
            'id' => $company->id,
            'name' => $company->name,
        ];
    }
}
