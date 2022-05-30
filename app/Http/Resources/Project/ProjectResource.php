<?php

namespace App\Http\Resources\Project;

use App\Models\Project;
use Illuminate\Http\Request;
use App\Http\Resources\Company\CompanyResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProjectResource extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  Request  $request
     * @return array
     */
    public function toArray($request)
    {
        /** @var Project $project */
        $project = $this;
        return [
            'id' => $project->id,
            'project_title' => $project->project_title,
            'description' => $project->description,
            'status' =>     $project->status,
            'company_id' => $project->company_id,
            'company' => new CompanyResource($project->company),
            'created_at' => $project->created_at->toISOString(),
            'updated_at' => $project->updated_at->toISOString()
        ];
    }
}
